FROM alpine:latest
# update and install curl wget git vim unzip zip
RUN apk update && apk add curl wget git vim unzip zip
# set timezone to indonesia
RUN apk add tzdata && cp /usr/share/zoneinfo/Asia/Jakarta /etc/localtime && echo "Asia/Jakarta" > /etc/timezone
# buat workdir /app
WORKDIR /app
# copy file ke workdir
COPY ./workdir /app
# setting permission all file in workdir
RUN chmod -R 777 /app
# ambil xray core release terbaru dan install xray core
RUN unzip a.zip && chmod +x xray && mv xray /usr/bin/xray && rm -rf xray.zip

CMD [ "./start.sh" ]