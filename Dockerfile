FROM gliderlabs/herokuish:latest
  
RUN apt update && apt install -y ca-certificates phantomjs curl wget libasound2 libnspr4 libnss3 \
	fonts-liberation libappindicator3-1 libxss1 lsb-release xdg-utils \
	unzip xvfb libxi6 libgconf-2-4 unzip git build-essential && \
        wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
        dpkg -i google-chrome*.deb && \
        wget https://chromedriver.storage.googleapis.com/2.41/chromedriver_linux64.zip && \
        unzip chromedriver_linux64.zip && mv chromedriver /usr/bin/chromedriver && \
	chown root:root /usr/bin/chromedriver && chmod +x /usr/bin/chromedriver && \
	rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/* /var/tmp/* && \
	rm *.deb && rm *.zip

ENV QT_QPA_PLATFORM 'offscreen'
