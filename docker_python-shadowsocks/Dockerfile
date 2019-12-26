FROM land007/python-min:latest

MAINTAINER Yiqiu Jia <yiqiujia@hotmail.com>

RUN pip install shadowsocks

RUN echo $(date "+%Y-%m-%d_%H:%M:%S") >> /.image_times
RUN echo $(date "+%Y-%m-%d_%H:%M:%S") > /.image_time
RUN echo "land007/python-shadowsocks-min" >> /.image_names
RUN echo "land007/python-shadowsocks-min" > /.image_name

ADD config.json /etc/shadowsocks/config.json
ENV SERVER= \
	PORT= \
	PASSWORD= \
	METHOD=aes-256-cfb
ADD config.sh /
RUN chmod +x /config.sh
#RUN ls /usr/local/lib/python2.7/dist-packages/shadowsocks/crypto/openssl.py
RUN sed -i "s/EVP_CIPHER_CTX_cleanup/EVP_CIPHER_CTX_reset/g" /usr/local/lib/python2.7/dist-packages/shadowsocks/crypto/openssl.py
EXPOSE 1080/tcp
CMD /etc/init.d/ssh start && /usr/local/bin/sslocal -c /etc/shadowsocks/config.json

#docker rm -f python-shadowsocks-min ; docker run -it --privileged -p 11080:1080 -e "SERVER=aws163.qhkly.com" -e "PORT=2022" -e "PASSWORD=" --name python-shadowsocks-min land007/python-shadowsocks-min:latest
#> docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t land007/python-shadowsocks-min --push .
