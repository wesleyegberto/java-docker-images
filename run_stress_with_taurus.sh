docker run -it --rm \
    --name taurus-tool \
    -v $(pwd)/taurus:/bzt-configs \
    -v $(pwd)/taurus/output:/tmp/artifacts \
    --link openjdk-11:openjdk-11 \
    --link graalvm-11:graalvm-11 \
    --link openj9-11:openj9-11 \
    --link openj9-11-tuned:openj9-11-tuned \
    blazemeter/taurus scenarios.yml