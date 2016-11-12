'use strict'

module.exports = {
  'nightwatch test': function (browser) {
    browser
      .url(browser.launch_url)
      .waitForElementVisible('#input', 1000)
      .expect.element('#input').text.to.equal('')
    browser
      .pause(1000)
      .setValue('#input', 'nightwatch')
      .expect.element('#result').text.to.equal('nightwatch')
    browser
      .pause(1000)
      .clearValue('#input')
      .setValue('#input', 'test')
      .expect.element('#result').text.to.equal('test')
    browser
      .pause(1000)
      .end()
  }
}
