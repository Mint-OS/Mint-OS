setup:
	@echo LineageOS location set to $(MINTOS_DIR)
	@echo "$(MINTOS_DIR)" > .makedata
prepare:
	@echo 'Mintifying LineageOS (Step 1/2)...'
	export MINTOS_DIR=`cat .makedata` MINTOS_DAT=`pwd` && cd $$MINTOS_DIR && mkdir -p .repo && mkdir -p .repo/local_manifests && cp $$MINTOS_DAT/99-mintos.xml ./.repo/local_manifests/
patch:
	@echo 'Mintifying LineageOS (Step 2/2)...'
	export MINTOS_DIR=`cat .makedata` MINTOS_DAT=`pwd` && cd $$MINTOS_DIR && cd art && git apply $$MINTOS_DAT/01-art.patch && cd .. && cd frameworks/base && git apply $$MINTOS_DAT/02-frameworks_base.patch
