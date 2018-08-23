ARG ALPINE_VERSION
FROM yoshiyuki/chromium4puppeteer:${ALPINE_VERSION}

COPY ./app /app

WORKDIR /app
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true
RUN npm install

ENV CHROME_BIN /usr/bin/chromium-browser

RUN addgroup -S pptruser && adduser -S -g pptruser pptruser \
    && mkdir -p /home/pptruser/Downloads \
    && chown -R pptruser:pptruser /home/pptruser \
    && chown -R pptruser:pptruser /app
USER pptruser

CMD npm test