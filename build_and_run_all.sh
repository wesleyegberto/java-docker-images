#!/usr/bin/env bash
set -e errexit

docker build -t wesleyegberto/hello-app:openjdk-11 -f Dockerfile.openjdk_11 .
docker build -t wesleyegberto/hello-app:openj9-11 -f Dockerfile.openj9_11 .
docker build -t wesleyegberto/hello-app:openj9-11-tuned -f Dockerfile.openj9_11_tuned .
# docker build -t wesleyegberto/hello-app:openj9-11-unpacked -f Dockerfile.openj9_11_unpacked .
docker build -t wesleyegberto/hello-app:openj9-11-unpacked-lazy -f Dockerfile.openj9_11_unpacked_lazy .
docker build -t wesleyegberto/hello-app:graalvm-21 -f Dockerfile.graalvm_21 .
docker build -t wesleyegberto/hello-app:graalvm-native -f Dockerfile.graalvm_native .

docker run -d --rm --cpus 1 --memory 512mi --name openjdk-11 wesleyegberto/hello-app:openjdk-11
docker run -d --rm --cpus 1 --memory 512mi --name openj9-11 wesleyegberto/hello-app:openj9-11
docker run -d --rm --cpus 1 --memory 512mi --name openj9-11-tuned wesleyegberto/hello-app:openj9-11-tuned
# docker run -d --rm --cpus 1 --memory 512mi --name openj9-11-unpacked wesleyegberto/hello-app:openj9-11-unpacked
docker run -d --rm --cpus 1 --memory 512mi --name openj9-11-unpacked-lazy wesleyegberto/hello-app:openj9-11-unpacked-lazy
docker run -d --rm --cpus 1 --memory 512mi --name graalvm-21 wesleyegberto/hello-app:graalvm-21
docker run -d --rm --cpus 1 --memory 512mi --name graalvm-native wesleyegberto/hello-app:graalvm-native
