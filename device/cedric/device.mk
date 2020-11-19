all: prepare patch

prepare:
	@export MINTOS_DIR=`cat .makedata` MINTOS_DAT=`pwd` MINTOS_DEVICE=`cat .makedata2` && cp $$MINTOS_DAT/device/cedric/90-cedric.xml $$MINTOS_DIR/.repo/local_manifests

patch:
	@export MINTOS_DIR=`cat .makedata` MINTOS_DAT=`pwd` MINTOS_DEVICE=`cat .makedata2` && cd $$MINTOS_DIR/kernel/motorola/msm8953 && wget -O- https://github.com/JarlPenguin/android_kernel_motorola_msm8953/commit/2d4883a56120688e8b893a816ad6ffaa47cb0085.patch | patch -p1
	@export MINTOS_DIR=`cat .makedata` MINTOS_DAT=`pwd` MINTOS_DEVICE=`cat .makedata2` && cd $$MINTOS_DIR/device/motorola/cedric && wget -O- https://github.com/moto-msm8937/android_device_motorola_cedric/commit/a7feb87698b684ae944190a9a7a9dfdd35854e7b.patch | patch -p1
	@export MINTOS_DIR=`cat .makedata` MINTOS_DAT=`pwd` MINTOS_DEVICE=`cat .makedata2` && cd $$MINTOS_DIR/device/motorola/msm8937-common && wget -O- https://github.com/moto-msm8937/android_device_motorola_msm8937-common/commit/2681f66956c516c83c659efbaefae2552187700a.patch | patch -p1
