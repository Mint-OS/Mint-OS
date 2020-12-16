all: prepare patch

prepare:
	@export MINTOS_DIR=`cat .makedata` MINTOS_DAT=`pwd` MINTOS_DEVICE=`cat .makedata2` && cp $$MINTOS_DAT/device/cedric/90-cedric.xml $$MINTOS_DIR/.repo/local_manifests
