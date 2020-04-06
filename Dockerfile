FROM node:12
LABEL name="java-node-chrome"

# Add google keys
RUN echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' > /etc/apt/sources.list.d/chrome.list
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -

# Install chrome
RUN set -x \
    && apt-get update \
    && apt-get install -y \
        google-chrome-stable

# Set chrome env
ENV CHROME_BIN /usr/bin/google-chrome

# Install java
RUN set -x \
    && apt-get update \
    && apt-get install -y \
	openjdk-8-jdk


# Log versions
RUN set -x \
    && node -v \
    && npm -v \
    && google-chrome --version \
    && java -version
