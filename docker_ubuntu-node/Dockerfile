#FROM land007/ubuntu-build-arm:latest
FROM ubuntu:latest

MAINTAINER Yiqiu Jia <yiqiujia@hotmail.com>

#RUN apt-get update && apt-get install -y python ffmpeg && apt-get clean
RUN apt-get update && apt-get install -y net-tools iputils-ping wget && apt-get clean
RUN wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
ENV NVM_DIR=/root/.nvm \
#	SHIPPABLE_NODE_VERSION=v8.11.1
#	SHIPPABLE_NODE_VERSION=v8.14.0
#	SHIPPABLE_NODE_VERSION=v9.11.1
#	SHIPPABLE_NODE_VERSION=v9.11.2
#	SHIPPABLE_NODE_VERSION=v10.13.0
	SHIPPABLE_NODE_VERSION=v10.14.1
RUN . $HOME/.nvm/nvm.sh && nvm install $SHIPPABLE_NODE_VERSION && nvm alias default $SHIPPABLE_NODE_VERSION && nvm use default && npm config set unsafe-perm true
RUN . $HOME/.nvm/nvm.sh && cd / && npm init -y && npm install -g node-gyp supervisor http-server && npm install socket.io ws express http-proxy bagpipe eventproxy chokidar request nodemailer await-signal log4js moment && \
#RUN . $HOME/.nvm/nvm.sh && nvm install $SHIPPABLE_NODE_VERSION && nvm alias default $SHIPPABLE_NODE_VERSION && nvm use default && npm install gulp babel  jasmine mocha serial-jasmine serial-mocha aws-test-worker -g && \
#	. $HOME/.nvm/nvm.sh && cd / && npm install pty.js && \
	. $HOME/.nvm/nvm.sh && which node
#RUN ln -s /root/.nvm/versions/node/$SHIPPABLE_NODE_VERSION/bin/node /usr/bin/node
#RUN ln -s /root/.nvm/versions/node/$SHIPPABLE_NODE_VERSION/bin/supervisor /usr/bin/supervisor
ENV PATH $PATH:/root/.nvm/versions/node/$SHIPPABLE_NODE_VERSION/bin

ADD check.sh /
RUN sed -i 's/\r$//' /check.sh && chmod a+x /check.sh
# Define working directory.
#RUN mkdir /node
ADD node /node
RUN ln -s $HOME/.nvm/versions/node/$SHIPPABLE_NODE_VERSION/lib/node_modules /node && \
	sed -i 's/\r$//' /node/start.sh && chmod a+x /node/start.sh && \
	ln -s /node ~/ && ln -s /node /home/land007 && \
	mv /node /node_
WORKDIR /node
VOLUME ["/node"]

RUN echo $(date "+%Y-%m-%d_%H:%M:%S") >> /.image_times && \
	echo $(date "+%Y-%m-%d_%H:%M:%S") > /.image_time && \
	echo "land007/ubuntu-node-min" >> /.image_names && \
	echo "land007/ubuntu-node-min" > /.image_name

EXPOSE 80/tcp
#CMD /check.sh /node ; /etc/init.d/ssh start ; /node/start.sh
RUN echo "/check.sh /node" >> /start.sh && \
#RUN echo "supervisor -w /node/ /node/server.js" >> /start.sh && \
#	echo "/usr/bin/nohup supervisor -w /node/ /node/server.js > /node/node.out 2>&1 &" >> /start.sh
	echo "supervisor -w /node/ /node/server.js" >> /start.sh
RUN chmod +x /start.sh
CMD /start.sh

#> docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t land007/ubuntu-node-min --push .
#> docker buildx build --platform linux/arm/v7 -t land007/ubuntu-node-arm --load .
#> docker buildx build --platform linux/arm/v7 -t land007/ubuntu-node-min --load .
#> docker buildx build --platform linux/arm64 -t land007/ubuntu-node-min --load .
#> docker buildx build --platform linux/amd64 -t land007/ubuntu-node-min --load .
#> docker run --rm -it land007/ubuntu-node-arm bash
#> docker run --rm -it land007/ubuntu-node-min bash
#sudo docker rm -f ubuntu-node-arm ; sudo docker run -it --privileged -v ~/docker/ubuntu-node-arm:/node -p 22080:80 --name ubuntu-node-arm land007/ubuntu-node-arm:latest bash -c "/check.sh /node && supervisor -w /node/ /node/server.js"
#sudo docker rm -f ubuntu-node-min ; sudo docker run -it --privileged --restart=always -v ~/docker/ubuntu-node-min:/node -p 80:80 --name ubuntu-node-min land007/ubuntu-node-min:latest
