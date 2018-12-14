FROM alpine:latest

RUN apk update

RUN apk add git

RUN apk add go

RUN git clone -b r1.7 https://github.com/tensorflow/tensorflow /libtf/tensorflow

RUN git clone -b r1.7 https://github.com/tensorflow/serving /libtf/serving

RUN apk add --update libstdc++

RUN apk add --no-cache musl-dev

RUN apk add protobuf

RUN go get -u -v github.com/golang/protobuf/protoc-gen-go

RUN go get -u -v google.golang.org/grpc

ADD tensorflow /root/go/src/tensorflow
ADD tensorflow_serving /root/go/src/tensorflow_serving

WORKDIR /root/go/src/github.com/medtune

RUN git clone -b dev https://github.com/medtune/beta-platform
RUN go get -u -v -d ./beta-platform/... 
RUN go build -o medtune-platform beta-platform/cmd/main.go

