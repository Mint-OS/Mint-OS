all: prepare patch

prepare:
	@export MINTOS_DIR=`cat .makedata` MINTOS_DAT=`pwd` MINTOS_DEVICE=`cat .makedata2` && cp $$MINTOS_DAT/device/cedric/90-cedric.xml $$MINTOS_DIR/.repo/local_manifests

patch:
	@export MINTOS_DIR=`cat .makedata` MINTOS_DAT=`pwd` MINTOS_DEVICE=`cat .makedata2` && cd $$MINTOS_DIR/kernel/motorola/msm8937 && wget -O- https://github.com/nift4/android-keyboard-gadget/raw/linux-3.18/generic_kernel_3.18.patch | patch -p1
	@export MINTOS_DIR=`cat .makedata` MINTOS_DAT=`pwd` MINTOS_DEVICE=`cat .makedata2` && cd $$MINTOS_DIR/device/motorola/cedric && wget -O- https://github.com/Sohamlad7/android_device_motorola_cedric/commit/fe1564fb738ec698ade687a43be4e9e3b7270de2.patch | patch -p1

