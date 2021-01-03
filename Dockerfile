FROM node:12.20.0-alpine3.9

# sed -i 插入新的一行
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

# install git - apt-get replace with apk
RUN apk update && \
    apk upgrade && \
    apk add --no-cache bash git openssh && \
    apk add make

RUN git clone https://github.com/docker-in-practice/todo.git


WORKDIR todo

ARG CACHEBUST=no

RUN npm install > /dev/null

EXPOSE 8000
CMD ["npm","start"]
