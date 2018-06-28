#!/usr/bin/env bash

ts=$(date +%s)

for img in $(docker images "build/*" --format "{{.Repository}}:{{.Tag}}") ; do
  dest="${img#build/}"
  dest="${dest%:latest}"
  case "${dest}" in [0-9]*) continue ;; esac
  docker tag "${img}" "${DOCKER_SINK}/xenial-installer:${dest}"
  docker tag "${img}" "${DOCKER_SINK}/xenial-installer:${dest}.${ts}"
  [ "${NOPUSH}" ] || {
    docker push "${DOCKER_SINK}/xenial-installer:${dest}"
    docker push "${DOCKER_SINK}/xenial-installer:${dest}.${ts}"
  }
done

