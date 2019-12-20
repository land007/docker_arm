FROM land007/ubuntu-arm:latest

MAINTAINER Yiqiu Jia <yiqiujia@hotmail.com>

RUN apt-get install -y build-essential cmake

RUN echo $(date "+%Y-%m-%d_%H:%M:%S") >> /.image_times && \
	echo $(date "+%Y-%m-%d_%H:%M:%S") > /.image_time && \
	echo "land007/ubuntu-build" >> /.image_names && \
	echo "land007/ubuntu-build" > /.image_name

#> docker buildx build  --platform linux/amd64,linux/arm64,linux/arm/v7 -t land007/ubuntu-build-all --push .
#docker stop ubuntu-build ; docker rm ubuntu-build ; docker run -it --privileged --name ubuntu-build land007/ubuntu-build:latest
