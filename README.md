# chromium4puppeteer
Alpine based node.js image for executing puppeteer. This image includes chromium.

## versions
- edge
- v3.8

## example
```dockerfile
FROM yoshiyuki/chromium4puppeteer:v3.8

COPY /path/to/your/app /app

WORKDIR /app
RUN npm install

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true
RUN npm install puppeteer@1.4.0
ENV CHROME_BIN /usr/bin/chromium-browser

RUN addgroup -S pptruser && adduser -S -g pptruser pptruser \
    && mkdir -p /home/pptruser/Downloads \
    && chown -R pptruser:pptruser /home/pptruser \
    && chown -R pptruser:pptruser /app
USER pptruser

CMD npm start
```

```js
puppeteer.launch({
  executablePath: process.env.CHROME_BIN,
  args: [
    '--no-sandbox',
    '--disable-gpu',
    '--disable-dev-shm-usage'
  ]
});
```