'use strict'

/*
 * Nightwatch.js module to record the webdriver X11 display via ffmpeg.
 *
 * Copyright 2016, Sebastian Tschan
 * https://blueimp.net
 *
 * Licensed under the MIT license:
 * https://opensource.org/licenses/MIT
 */

// Function to create a directory similar to the shell "mkdir -p" command:
function mkdirp (dir, mode) {
  const path = require('path')
  const fs = require('fs')
  dir = path.resolve(dir)
  if (fs.existsSync(dir)) return dir
  try {
    fs.mkdirSync(dir, mode)
    return dir
  } catch (error) {
    if (error.code === 'ENOENT') {
      return mkdirp(path.dirname(dir), mode) && mkdirp(dir, mode)
    }
    throw error
  }
}

module.exports = {
  start: function (browser, done) {
    const settings = browser.globals.test_settings
    const videoSettings = settings.videos
    const currentTest = browser.currentTest
    if (videoSettings && videoSettings.enabled) {
      const dateTime = new Date().toISOString().split('.')[0].replace(/:/g, '-')
      const format = videoSettings.format || 'mp4'
      const fileName = `${currentTest.module}-${dateTime}.${format}`
      const path = require('path')
      const file = path.resolve(path.join(videoSettings.path || '', fileName))
      mkdirp(path.dirname(file))
      browser.ffmpeg = require('child_process').execFile(
        'ffmpeg',
        [
          '-video_size',
          videoSettings.resolution || '1440x900',
          '-r',
          videoSettings.fps || 15,
          '-f',
          'x11grab',
          '-i',
          settings.selenium_host + (videoSettings.display || ':60'),
          '-pix_fmt',
          videoSettings.pixel_format || 'yuv420p', // QuickTime compatibility
          '-loglevel',
          'error',
          file
        ],
        function (error, stdout, stderr) {
          browser.ffmpeg = null
          if (error) {
            // At the start, the video capture always logs an ignorable x11grab
            // "image data event_error", which we can safely ignore:
            const stderrLines = stderr.split('\n')
            if (stderrLines.length !== 2 ||
                !/x11grab .* image data event_error/.test(stderrLines[0])) {
              throw error
            }
          }
        }
      ).on('close', function () {
        // If on_failure is set, delete the video file unless the tests failed:
        if (videoSettings.delete_on_success && !currentTest.results.failed) {
          require('fs').unlink(file)
        }
      })
    }
    done()
  },
  stop: function (browser, done) {
    const ffmpeg = browser.ffmpeg
    if (ffmpeg) {
      ffmpeg.on('close', function () { done() }).kill()
    } else {
      done()
    }
  }
}
