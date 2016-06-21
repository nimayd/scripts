#!/bin/bash

del_logs () {

sudo rm -rf /tmp/mesos/agent/slaves
sudo mkdir /tmp/mesos/agent/slaves

}

del_containers () {

sudo docker rm $(sudo docker ps -a -q)

}

del_images () {

sudo docker rmi $(sudo docker images -q)

}

case $1 in
    "logs")
        del_logs
        exit 0
        ;;
    "containers")
        del_containers
        exit 0
        ;;
    "images")
        del_images
        exit 0;
        ;;
    "all")
        del_logs
        del_containers
        del_images
        exit 0
        ;;
    *)
        echo >&2 "valid options: all, logs, containers, images"
        exit 1
        ;;
esac
