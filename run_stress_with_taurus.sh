#!/usr/bin/env bash
docker run -it --rm \
    --name taurus-tool \
    -v $(pwd)/taurus:/bzt-configs \
    -v $(pwd)/taurus/output:/tmp/artifacts \
    --link openjdk-11:openjdk-11 \
    --link openj9-11:openj9-11 \
    --link openj9-11-tuned:openj9-11-tuned \
    --link openj9-11-unpacked-lazy:openj9-11-unpacked-lazy \
    --link graalvm-21:graalvm-21 \
    --link graalvm-native:graalvm-native \
    blazemeter/taurus scenarios.yml