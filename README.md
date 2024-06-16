# Java Docker Images

Repository to test different Docker images.

Project structure:

* *hello-app*: Spring Boot app with simple REST controller.
* *hello-app-native*: Spring Boot app with simple REST controller and Native plugin.
* *images*: printscreens.
* *taurus*: scenarios script to run Taurus stress test.
* *ab-test*: script to run a monitored Apache Bench test against a local process.

Recommendations:

* always unpack the JAR

## Build the App

First build the app with: `sh build_app.sh`.

Test the app: `curl http://localhost:8080/greetings`

## Build the Docker images

Images:

* OpenJDK
  * `docker build -t wesleyegberto/hello-app:minimal -f Dockerfile.openjdk_11 .`
* Open J9
  * `docker build -t wesleyegberto/hello-app:minimal -f Dockerfile.openj9_11 .`
* Open J9 Tuned - CDS
  * `docker build -t wesleyegberto/hello-app:minimal -f Dockerfile.openj9_11_tuned .`
* Open J9 Tuned - Unpacked, CDS, Lazy Inicialization
  * `docker build -t wesleyegberto/hello-app:minimal -f Dockerfile.openj9_11_unpacked_lazy .`
* GraalVM 21 - JVM
  * `docker build -t wesleyegberto/hello-app:minimal -f Dockerfile.graalvm_21 .`
* GraalVM 21 - Native
  * `docker build -t wesleyegberto/hello-app:minimal -f Dockerfile.graalvm_native .`
* Liberica JVM 21 - AOT and CDS
  * `docker build -t wesleyegberto/hello-app:minimal -f Dockerfile.liberica_21_cds .`

## Stressing and Stats

Run any of the built Java images binding the port 8080.

Then run stress test with ApacheBench: `sh run_stress_with_ab.sh`

Monitoring docker stats: `docker stats`

Here is a sample from stats output after some minutes of idle (on my machine :p).

![Docker Stats Idle](images/docker_stats_idle.png)

Under stressing:

![Docker Stats Stressing](images/docker_stats_stressing.png)

### Taurus

Run all containers: `build_and_run_all.sh`

Run Blazemeter container with Taurus tool: `sh run_stress_with_taurus.sh`

## TODO

* [x] Spring Boot splitting the lib and classes
* [x] Spring Boot Native build
* [x] Spring Boot Native with GraalVM
* [x] Spring Boot with AOT and CDS

## Links

* [Spring Boot & JVM blog post](https://medium.com/@jean_sossmeier/spring-boot-jvm-1eea422be930)
* [Chris Newland's blog](https://www.chriswhocodes.com/)
* [GraalVM Native Image Tips & Tricks](https://jamesward.com/2020/05/07/graalvm-native-image-tips-tricks/)
* [Efficient containers with Spring Boot 3, Java 21 and CDS by Sébastien Deleuze @ Spring I/O 2024](https://www.youtube.com/watch?v=H2tM7EClyx8)
