'use strict'

module.exports = {
  'sample test': function(browser) {
    browser
      .url(browser.launch_url)
      .waitForElementVisible('#input', 1000)
      .expect.element('#input')
      .text.to.equal('')
    browser
      .setValue('#input', 'nightwatch')
      .expect.element('#result')
      .text.to.equal('nightwatch')
    browser
      .clearValue('#input')
      .setValue('#input', 'test')
      .expect.element('#result')
      .text.to.equal('test')
    browser.end()
  }
}
