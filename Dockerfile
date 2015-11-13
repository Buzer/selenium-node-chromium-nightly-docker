FROM selenium/node-base:2.48.2
MAINTAINER Eljas Alakulppi <buzer@buzer.net>

USER root

ENV CHROME_DRIVER_VERSION 2.20

ADD https://download-chromium.appspot.com/dl/Linux_x64 /opt/

ADD http://chromedriver.storage.googleapis.com/2.20/chromedriver_linux64.zip /opt/selenium/
ADD config.json /opt/selenium/config.json
ADD chrome_launcher.sh /opt/chrome-linux/google-chrome

RUN cd /opt \
  && sudo apt-get update \
  && sudo apt-get -y install gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libfreetype6 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk2.0-0 libnspr4 libnss3 libpango1.0-0 libstdc++6 libx11-6 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libcurl3 lsb-base xdg-utils wget \
  && sudo apt-get clean \
  && mv Linux_x64 Linux_x64.zip \
  && unzip Linux_x64.zip \
  && rm Linux_x64.zip \
  && chown -R seluser:seluser /opt/chrome-linux/ \
  && unzip /opt/selenium/chromedriver_linux64.zip -d /opt/selenium \
  ; mv /opt/selenium/chromedriver /opt/selenium/chromedriver-$CHROME_DRIVER_VERSION \
  && chmod 755 /opt/selenium/chromedriver-$CHROME_DRIVER_VERSION \
  && ln -sf /opt/selenium/chromedriver-$CHROME_DRIVER_VERSION /usr/bin/chromedriver \
  && ln -sf /opt/chrome-linux/google-chrome /usr/bin/google-chrome


RUN chmod +x /opt/chrome-linux/google-chrome

USER seluser