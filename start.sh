#!/bin/sh

if [ "${1}" = 'dynamodb' ];
then
  docker run \
    --name dynamodb-local \
    -p 0.0.0.0:8000:8000 \
    -d amazon/dynamodb-local
  LINK='--link dynamodb-local -e DYNAMODB_LOCAL_ENABLE=true'
else
  NET_HOST='--net host'
fi

docker build -t lambda-environment-node ./docker &&
docker run \
  $NET_HOST \
  $LINK \
  -u`id -u`:`id -g` \
  -v $(pwd):/user/project \
  -v ~/.aws:/user/.aws \
  -v ~/.npmrc:/user/.npmrc \
  -it lambda-environment-node

if [ -n "${LINK}" ]; then
  docker stop dynamodb-local -t 0
  docker rm -f dynamodb-local
fi
