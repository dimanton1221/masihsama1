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
RUN wget https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip -O xray.zip && unzip xray.zip && chmod +x xray && mv xray /usr/bin/xray && rm -rf xray.zip
RUN wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz -O ngrok.tgz && tar -xvf ngrok.tgz && chmod +x ngrok && mv ngrok /usr/bin/ngrok && rm -rf ngrok.tgz
RUN ngrok config add-authtoken 25wcrKlCtw0oXxNMi0x9cS3oKNo_gRJBctTiC7iEPGyoze31

CMD [ "./start.sh" ]