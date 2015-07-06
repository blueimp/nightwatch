module.exports = {
  'Nightwatch.js Test' : function (browser) {
    browser
      .url(browser.launch_url)
      .waitForElementVisible('body', 1000)
      .setValue('#input', 'nightwatch')
      .assert.containsText('#result', 'nightwatch')
      .end();
  }
};
