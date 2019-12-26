FROM land007/python-shadowsocks-min:latest

MAINTAINER Yiqiu Jia <yiqiujia@hotmail.com>

RUN apt-get update && apt-get install -y privoxy && apt-get clean

RUN echo $(date "+%Y-%m-%d_%H:%M:%S") >> /.image_times
RUN echo $(date "+%Y-%m-%d_%H:%M:%S") > /.image_time
RUN echo "land007/python-shadowsocks-privoxy-min" >> /.image_names
RUN echo "land007/python-shadowsocks-privoxy-min" > /.image_name

#RUN cat /etc/privoxy/config
ADD config /etc/privoxy/config
EXPOSE 8118/tcp
CMD service privoxy start && /config.sh && /usr/local/bin/sslocal -c /etc/shadowsocks/config.json

#docker 
#docker rm -f python-shadowsocks-privoxy-min ; docker run -d --restart always --privileged -e "SERVER=aws163.qhkly.com" -e "PORT=2022" -e "PASSWORD=" -p 18118:8118 -p 11080:1080 --name python-shadowsocks-privoxy-min land007/python-shadowsocks-privoxy-min:latest
#> docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t land007/python-shadowsocks-privoxy-min --push .
