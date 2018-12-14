tensorflow-go:
	docker build \
		-t medtune/tensorflow:1.3-go1.9 \
		-f tensorflow/go.Dockerfile \
		.

tensorflow-go-gpu:
	docker build \
		-t medtune/tensorflow:1.3-go1.9-gpu \
		-f tensorflow/go_gpu.Dockerfile \
		.

tensorflow-client-go:
	docker build \
		-t medtune/tensorflow:serving-client-go \
		-f tfserving/client/go.Dockerfile \
		.

build: tensorflow-go \
	tensorflow-go-gpu \
	tensorflow-client-go

push:
	docker push medtune/tensorflow:1.3-go1.9
	docker push medtune/tensorflow:1.3-go1.9-gpu
	docker push medtune/tensorflow:serving-client-go