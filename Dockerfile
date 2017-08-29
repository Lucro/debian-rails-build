FROM lucro/debian-rails:2.4.1
MAINTAINER Lucro Engineering <dev@lucro.com>

ENV DEV_PACKAGES="build-essential wget git chrpath libssl-dev libxft-dev libsqlite3-0 libmysqlclient-dev webkit-image-qt qtbase5-dev libfreetype6 libfreetype6-dev libfontconfig1 libconfig-dev qt5-default libqt5webkit5-dev gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x"

RUN apt-get update && \
    apt-get install -y $DEV_PACKAGES && \
    apt-get clean

WORKDIR ~

# Use mirror since bitbucket auth is not working
RUN wget http://cnpmjs.org/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 && \
    tar xvjf phantomjs-2.1.1-linux-x86_64.tar.bz2 -C /usr/local/share/ && \
    ln -sf /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin

CMD [ "/bin/sh" ]
