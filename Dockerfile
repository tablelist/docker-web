FROM node:4.4.3

MAINTAINER Tablelist "dev@tablelist.com"

RUN npm install -g bower

RUN npm install -g gulp-cli

# download Google signing key for Linux
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -

# add Google Chrome to repository
RUN sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

RUN apt-get update \
    apt-get install default-jre -y \
    apt-get install xvfb -y \
    apt-get install google-chrome-stable -y

ENV CHROME_BIN /usr/bin/google-chrome

# Start xvfb which gives the context a virtual display
ENV DISPLAY=:99.0
RUN start-stop-daemon --start --quiet --pidfile /tmp/xvfb_99.pid --make-pidfile --background --exec /usr/bin/Xvfb -- :99 -screen 0 1024x768x24 -ac +extension GLX +render -noreset

# Give xvfb time to start. 3 seconds is the default for all xvfb-run commands.
RUN sleep 3
