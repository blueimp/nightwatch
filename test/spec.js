module.exports = {
  'Nightwatch.js Test': function (browser) {
    browser
      .url(browser.launch_url)
      .waitForElementVisible('#input', 1000)
    browser
      .pause(1000)
      .clearValue('#input')
      .expect.element('#input').text.to.equal('')
    browser
      .setValue('#input', 'nightwatch')
      .expect.element('#result').text.to.equal('nightwatch')
    browser
      .pause(1000)
      .clearValue('#input')
      .expect.element('#input').text.to.equal('')
    browser
      .setValue('#input', 'e2e')
      .expect.element('#result').text.to.equal('e2e')
    browser
      .pause(1000)
      .clearValue('#input')
      .expect.element('#input').text.to.equal('')
    browser
      .setValue('#input', 'test')
      .expect.element('#result').text.to.equal('test')
    browser
      .pause(1000)
      .end()
  }
}
