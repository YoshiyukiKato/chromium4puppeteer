const puppeteer = require("puppeteer");
const assert = require("assert");

describe("launch puppeteer", () => {
  it("runs without error", () => {
    return puppeteer.launch({
      executablePath: process.env.CHROME_BIN,
      args: [
        '--no-sandbox',
        '--disable-gpu',
        '--disable-dev-shm-usage'
      ]
    }).then((browser) => {
      return browser.close();
    }).then(() => {
      assert(true);
    });
  });
});