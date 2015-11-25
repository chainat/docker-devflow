#!/bin/bash
export APP_BASE_PATH=/var/www/devflow
export APP_NAMESPACE=devflow

export APP_VER_WEB="0.1"
export APP_VER_DATA="0.1"
export APP_VER_DATABASE="0.1"


#------------------------------------------------------------#
# build ()
# For building docker image by given repo & tag
#------------------------------------------------------------#
build () {
    NAME=$1
    VERSION=$2
    info "Building $1 image..."

    cd $APP_BASE_PATH
    TAG=$APP_NAMESPACE/$NAME:$VERSION
    sudo docker build --file="docker/config/Dockerfile.$NAME" --tag=$TAG $APP_BASE_PATH

    # Tag latest
    sudo docker tag -f $TAG $APP_NAMESPACE/$NAME:latest
}

#------------------------------------------------------------#
# info ()
#------------------------------------------------------------#
info () {
    TITLE=$1
    echo "#--------------------------------------------------#"
    echo "#    $TITLE"
    echo "#--------------------------------------------------#"
}

cmd_build_web () {
    build "web" $APP_VER_WEB
}

cmd_build_data () {
    build "data" $APP_VER_WEB
}

cmd_build_database() {
    build "database" $APP_VER_DATABASE
}

cmd_remove_all_free_rmi () {
    sudo docker rmi `sudo docker images -q`
}

cmd_build_all () {
    build "web" APP_VER_WEB
    build "data" APP_VER_DATA
    build "database" APP_VER_DATABASE
}

docker_cmd () {
    #if [ $1 -eq "" ]; then echo "Please specify command"; exit; fi
    #AVAILABLE="|build_all_images|remove_all_free_rmi|"

    # call command method
    cmd_$1
}

# call cmd if this is direct called from terminal
[[ "${BASH_SOURCE[0]}" == "${0}" ]] && docker_cmd $1


