FROM arobson/debian-rails:latest
MAINTAINER arobson <arobson@gmail.com>

ENV DEV_PACKAGES="build-essential wget git chrpath libssl-dev libxft-dev libsqlite3-0 libmysqlclient-dev webkit-image-qt qtbase5-dev libfreetype6 libfreetype6-dev libfontconfig1 libconfig-dev"

RUN apt-get update
RUN apt-get install -y $DEV_PACKAGES
RUN apt-get clean
RUN cd ~ && \
    wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 && \
    tar xvjf phantomjs-2.1.1-linux-x86_64.tar.bz2 -C /usr/local/share/ && \
    ln -sf /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin

CMD [ "/bin/sh" ]
