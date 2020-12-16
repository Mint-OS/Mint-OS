all: prepare patch

prepare:
	@export MINTOS_DIR=`cat .makedata` MINTOS_DAT=`pwd` MINTOS_DEVICE=`cat .makedata2` && cp $$MINTOS_DAT/device/cedric/90-cedric.xml $$MINTOS_DIR/.repo/local_manifests

patch:
	@export MINTOS_DIR=`cat .makedata` MINTOS_DAT=`pwd` MINTOS_DEVICE=`cat .makedata2` && cd $$MINTOS_DIR/device/motorola/cedric && wget -O- https://github.com/moto-msm8937/android_device_motorola_cedric/commit/a7feb87698b684ae944190a9a7a9dfdd35854e7b.patch | patch -p1
