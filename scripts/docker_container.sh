#!/usr/bin/bash

podman run \
    -it \
    -v $(pwd):/mnt:z \
    -w /mnt \
    localhost/pangenome-workflow:latest \
    bash
