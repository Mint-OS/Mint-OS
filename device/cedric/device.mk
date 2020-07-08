all: prepare patch

prepare:
	@export MINTOS_DIR=`cat .makedata` MINTOS_DAT=`pwd` MINTOS_DEVICE=`cat .makedata2` && cp $$MINTOS_DAT/device/cedric/90-cedric.xml $$MINTOS_DIR/.repo/local_manifests

patch:
	@export MINTOS_DIR=`cat .makedata` MINTOS_DAT=`pwd` MINTOS_DEVICE=`cat .makedata2` && cd $$MINTOS_DIR/kernel/motorola/msm8937 && wget -O- https://github.com/nift4/android-keyboard-gadget/raw/linux-3.18/generic_kernel_3.18.patch | patch -p1
	@export MINTOS_DIR=`cat .makedata` MINTOS_DAT=`pwd` MINTOS_DEVICE=`cat .makedata2` && cd $$MINTOS_DIR/device/motorola/cedric && wget -O- https://github.com/Sohamlad7/android_device_motorola_cedric/commit/49e9ac7bdccc03729dff0a3f4eff676a75ef3d38 | patch -p1
	@export MINTOS_DIR=`cat .makedata` MINTOS_DAT=`pwd` MINTOS_DEVICE=`cat .makedata2` && cd $$MINTOS_DIR/device/motorola/cedric && wget -O- https://github.com/Sohamlad7/android_device_motorola_cedric/commit/851f1323a06cc08a2d77f73d2e2afc9ab2b26357.patch | patch -p1
	@export MINTOS_DIR=`cat .makedata` MINTOS_DAT=`pwd` MINTOS_DEVICE=`cat .makedata2` && cd $$MINTOS_DIR/device/motorola/cedric && awk '{sub("grep_fingerprint_magic_lol","google/coral/coral:10/QQ3A.200705.002/6506677:user/release-keys")}1' init/init_cedric.cpp > temp.txt && mv temp.txt init/init_cedric.cpp
