# Nightwatch.js video screen recording via ffmpeg
Record videos of [Nightwatch.js](http://nightwatchjs.org/) test sessions.  
Uses [ffmpeg](https://www.ffmpeg.org/) to capture a (remote) webdriver desktop
screen.

## Install

```sh
npm install nightwatch-video-recorder
```

## Usage

Add the following `beforeEach`/`afterEach` hooks:
```js
module.exports = {
  beforeEach: function (browser, done) {
    require('nightwatch-video-recorder').start(browser, done)
  },
  afterEach: function (browser, done) {
    require('nightwatch-video-recorder').stop(browser, done)
  }
}
```

Enable the video screen recording in your test settings:
```json
{
  "test_settings": {
    "default": {
      "videos": {
        "enabled": true,
        "delete_on_success": false,
        "path": "",
        "format": "mp4",
        "resolution": "1440x900",
        "fps": 15,
        "display": ":60",
        "pixel_format": "yuv420p"
      }
    }
  }
}
```

## License
Released under the [MIT license](https://opensource.org/licenses/MIT).

## Author
[Sebastian Tschan](https://blueimp.net/)
