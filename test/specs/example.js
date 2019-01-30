'use strict'

function screenshotPath(browser) {
  const path = require('path')
  const dateTime = new Date()
    .toISOString()
    .split('.')[0]
    .replace(/:/g, '-')
  const fileName = `${browser.currentTest.module}-${dateTime}.png`
  return path.resolve(
    path.join(browser.options.screenshots.path || '', fileName)
  )
}

module.exports = {
  'sample test': function(browser) {
    browser
      .url(browser.launch_url)
      .waitForElementVisible('#input', 1000)
      .expect.element('#input')
      .text.to.equal('')
    browser
      .pause(1000) // Prolong test for video demonstration
      .setValue('#input', 'nightwatch')
      .expect.element('#result')
      .text.to.equal('nightwatch')
    browser
      .pause(1000) // Prolong test for video demonstration
      .clearValue('#input')
      .setValue('#input', 'test')
      .expect.element('#result')
      .text.to.equal('test')
    browser
      .pause(1000) // Prolong test for video demonstration
      .saveScreenshot(screenshotPath(browser))
      .end()
  }
}
