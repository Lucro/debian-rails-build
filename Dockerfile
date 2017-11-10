FROM lucro/debian-rails:2.4.1.1
MAINTAINER Lucro Engineering <dev@lucro.com>

RUN apt-get update && \
    apt-get install -y build-essential \
    chrpath \
    fonts-liberation \
    gconf-service \
    git \
    gstreamer1.0-plugins-base \
    gstreamer1.0-tools \
    gstreamer1.0-x \
    libappindicator1 \
    libconfig-dev \
    libfreetype6 \
    libfreetype6-dev \
    libfontconfig1 \
    libgconf-2-4 \
    libgtk-3-0 \
    libmysqlclient-dev \
    libnspr4 \
    libnss3 \
    libsqlite3-0 \
    libssl-dev \
    libqt5webkit5-dev \
    libxft-dev \
    libxss1 \
    libxtst6 \
    xdg-utils \
    wget && \
    apt-get clean

WORKDIR ~

# Use mirror if bitbucket auth is not working
#RUN wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 && \
RUN  wget http://cnpmjs.org/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 && \
    tar xvjf phantomjs-2.1.1-linux-x86_64.tar.bz2 -C /usr/local/share/ && \
    ln -sf /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin && \
    rm phantomjs*.tar.bz2 && \
    npm install -g yarn

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
  dpkg -i google-chrome-stable_current_amd64.deb && \
  ln -s /usr/bin/google-chrome-stable /usr/bin/chrome && \
  rm google-chrome-stable_current_amd64.deb

RUN apt-get update && \
    apt-get install -y unzip && \
    wget https://chromedriver.storage.googleapis.com/2.33/chromedriver_linux64.zip && \
    unzip chromedriver_linux64.zip && \
    apt-get remove -y unzip && \
    apt-get clean && \
    mv chromedriver /usr/bin/chromedriver && \
    rm chromedriver*

CMD [ "/bin/sh" ]
