#!/bin/bash

docker run --rm \
    -p 8492:8492 \
    --device /dev/spidev0.1:/dev/spidev0.1 \
    --device /dev/gpiomem:/dev/gpiomem \
    -it local/pi_plates \
    /bin/bash
