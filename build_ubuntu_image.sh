#!/bin/sh

export PYTHONPATH=/usr/local/lib/python2.7/dist-packages
WORK_DIR=$PWD
UBUNTU_IMAGE_DIR=/home/darrenwu/workspace/projects/lyoncore/ubuntu-image
UBUNTU_IMAGE=$UBUNTU_IMAGE_DIR/ubuntu-image
#UBUNTU_IMAGE=/snap/bin/ubuntu-image

set -x
set -e
cd $UBUNTU_IMAGE_DIR
sudo $UBUNTU_IMAGE -c beta -o $WORK_DIR/dragon.img $WORK_DIR/dragon.model -d -u load_gadget_yaml -w $WORK_DIR/../workdir
sudo rm -rf $WORK_DIR/../workdir/unpack/gadget/
sudo cp -r $WORK_DIR/gadget $WORK_DIR/../workdir/unpack/gadget
sudo cp -f $WORK_DIR/gadget/uboot.env $WORK_DIR/../workdir/unpack/image/boot/uboot/uboot.env
#sudo $UBUNTU_IMAGE -d -u populate_filesystems -w $WORK_DIR/../workdir --resume
#sudo tar --xattrs -Jcpf $WORK_DIR/../workdir/part8/recovery/factory/system-boot.tar.xz -C ../workdir/part7/ .
#sudo tar --xattrs -Jcpf $WORK_DIR/../workdir/part8/recovery/factory/writable.tar.xz -C ../workdir/root/ .
sudo $UBUNTU_IMAGE  -d  -w $WORK_DIR/../workdir --resume

cd $WORK_DIR
