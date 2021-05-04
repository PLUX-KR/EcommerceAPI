FROM ruby:2.6.3

RUN apt-get update -qq \
  && apt-get install -y build-essential

# Node.js 설치
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - \
  && apt-get install -y nodejs \
  && npm install -g yarn

# 컨테이너의 루트에 webapp 폴더 생성
RUN mkdir /app
WORKDIR /app
