# EMQX docker rebuild

This dir holds a temp solution to fix EMQX releases prior to version 4.3.13
where the /opt/emqx/etc dir is a docker VOLUME.

## How to re-build

Execute command `./build.sh <version>`
It'll rebuild a image, and tag with: `emqx/emqx-ng:<version>`

## How to commit changes in `/opt/emqx/etc`

* Start a container (name it as you wish, in this example it's `myemqx1`)
  `docker run -name myemqx1 -it emqx/emqx-ng:<version> bash`
* Make changes in config files.
* Commit to another tag (name it as you wish, in this exmaple, it's `emqx-ng1`)
  `docker commit myemqx1 emqx/emqx-ng1:<version>`
