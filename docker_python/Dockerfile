FROM debian:latest

MAINTAINER Yiqiu Jia <yiqiujia@hotmail.com>

RUN apt-get update && apt-get install -y python python3 python-pip python3-pip && apt-get clean

RUN echo $(date "+%Y-%m-%d_%H:%M:%S") >> /.image_times
RUN echo $(date "+%Y-%m-%d_%H:%M:%S") > /.image_time
RUN echo "land007/python-min" >> /.image_names
RUN echo "land007/python-min" > /.image_name


#docker rm -f python-min ; docker run -it --privileged --name python land007/python-min:latest
#> docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t land007/python-min --push .
