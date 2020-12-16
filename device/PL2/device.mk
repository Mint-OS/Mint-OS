all: prepare

prepare:
	@export MINTOS_DIR=`cat .makedata` MINTOS_DAT=`pwd` MINTOS_DEVICE=`cat .makedata2` && cp $$MINTOS_DAT/device/PL2/90-PL2.xml $$MINTOS_DIR/.repo/local_manifests
