all: prepare patch

prepare:
	@export MINTOS_DIR=`cat .makedata` MINTOS_DAT=`pwd` MINTOS_DEVICE=`cat .makedata2` && cp $$MINTOS_DAT/device/cedric/90-cedric.xml $$MINTOS_DIR/.repo/local_manifests

patch:
	@export MINTOS_DIR=`cat .makedata` MINTOS_DAT=`pwd` MINTOS_DEVICE=`cat .makedata2` && cd $$MINTOS_DIR/kernel/motorola/msm8953 && wget -O- https://github.com/nift4/android-keyboard-gadget/raw/linux-3.18/generic_kernel_3.18.patch | patch -p1
	@export MINTOS_DIR=`cat .makedata` MINTOS_DAT=`pwd` MINTOS_DEVICE=`cat .makedata2` && cd $$MINTOS_DIR/device/motorola/cedric && wget -O- https://github.com/moto-msm8937/android_device_motorola_cedric/commit/a7feb87698b684ae944190a9a7a9dfdd35854e7b.patch | patch -p1
	@export MINTOS_DIR=`cat .makedata` MINTOS_DAT=`pwd` MINTOS_DEVICE=`cat .makedata2` && cd $$MINTOS_DIR/device/motorola/msm8937-common && wget -O- https://github.com/moto-msm8937/android_device_motorola_msm8937-common/commit/502e4c32821adc0791cfdcfde0436b6bbdf88fdb.patch | patch -p1
	@export MINTOS_DIR=`cat .makedata` MINTOS_DAT=`pwd` MINTOS_DEVICE=`cat .makedata2` && cd $$MINTOS_DIR/device/motorola/msm8937-common && wget -O- https://github.com/moto-msm8937/android_device_motorola_msm8937-common/commit/bef5e8e50cadf71d7f0d3f406523e8224e5e35a8.patch | patch -p1
	@export MINTOS_DIR=`cat .makedata` MINTOS_DAT=`pwd` MINTOS_DEVICE=`cat .makedata2` && cd $$MINTOS_DIR/device/motorola/msm8937-common && wget -O- https://github.com/moto-msm8937/android_device_motorola_msm8937-common/commit/7528fbb572897f7ec5da27ce1924b81eafc81785.patch | patch -p1
