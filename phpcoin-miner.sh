#!/bin/bash

working_dir="/root/workspace/phpcoin-miner"

if [ ! -d "$working_dir" ]; then
    echo "Working directory $working_dir does not exist"
    mkdir -p $working_dir
fi

pushd $working_dir

if [ -f "docker-compose.yaml" ]; then
    rm -rf docker-compose.yaml
fi
wget -q https://raw.githubusercontent.com/Chasing66/phpcoin-miner/main/docker-compose.yml -O docker-compose.yaml

docker-compose pull 2>&1 >/dev/null
docker-compose up -d
