Docker DevFlow
=========================== 
By: Chainat (25/11/2015)
Vagrant with docker for development workflow

## To start developing, please install
- Vagrant (refer http://www.vagrantup.com/downloads)
- Virtualbox (consult this document for installing Virtualbox - https://docs.vagrantup.com/v2/virtualbox)
- vagrant-vbguest plugin (On Mac, run this `vagrant plugin install vagrant-vbguest`) 


## Once you have installed above items, please follow these steps to see it in action:
- Go to the root of this repo
- run `vagrant up` to create a new virtual machine (or docker machine if this is done by a docker-machine command). Vagrant will create new VM with some others programs
    -- Proper guest additions (for synced folder) that match with your VirtualBox
    -- docker command
    -- docker-compose
    -- When provisioning the VM, it will build all images. It shouldn't take too long, please relax and enjoy watching [this video]( https://youtu.be/Xn3tUOJ9yv4). At the end of this process, all container images should be built and ready to be started.

## Starting containers
- Go to the root of this repo, and ensure that you have started the VM by running `vagrant up`
- run `vagrant ssh` to shell access to this box.
- `sudo su && cd /var/www/devflow`
- `docker-compose -f docker/web/web.dev.yml up -d`
-  Open your browser and point it to http://192.168.10.10, you should see the page there.

## Developing the code
-  You can edit `/code/index.php` by using your favourite editor on your development machine (i.e. Sublime on Mac). The changes will be available immediately inside the container without using rsync or rebuilding the image.

## handy docker commands
- `docker images` - list all built/download images
- `docker ps`   - list all running containers
- `docker-compose -f docker/web/web.dev.yml stop`  - To stop all running containers
- `docker logs -f docker/web/web.dev.yml logs` - to see logs from all containers
- `docker exec {container-name} {shell command}` - to run a command on the target container
- `/docker/scripts/docker-cmd.sh  build_all` - to build all images. You can see dockerfiles in /docker/config. You should run this if you update the dockerfile.






