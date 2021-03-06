FROM gliderlabs/herokuish:latest
  
RUN apt update && apt install -y ca-certificates phantomjs curl wget libasound2 libnspr4 libnss3 \
	fonts-liberation fontconfig pcregrep libappindicator3-1 libxss1 lsb-release xdg-utils \
	unzip xvfb libxi6 libgconf-2-4 unzip git build-essential python-dev python-pip python3-pip && \
        wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
        dpkg -i google-chrome*.deb && \
        wget https://chromedriver.storage.googleapis.com/2.41/chromedriver_linux64.zip && \
        unzip chromedriver_linux64.zip && mv chromedriver /usr/bin/chromedriver && \
	chown root:root /usr/bin/chromedriver && chmod +x /usr/bin/chromedriver && \
	apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/* /var/tmp/* && \
	rm *.deb && rm *.zip

RUN mkdir -p /tmp/.X11-unix && chmod 1777 /tmp/.X11-unix
ADD xvfb.sh /bin/start_xvfb
RUN chmod +x /bin/start_xvfb

ENV DISPLAY :99

ENV NODE_VERSION=10.15.3

RUN curl https://deb.nodesource.com/node_10.x/pool/main/n/nodejs/nodejs_$NODE_VERSION-1nodesource1_amd64.deb > node.deb \
 && dpkg -i node.deb \
 && rm node.deb
