setup:
	@echo LineageOS \(for $(MINTOS_DEVICE)\) location set to $(MINTOS_DIR)
	@echo "$(MINTOS_DIR)" > .makedata
	@echo "$(MINTOS_DEVICE)" > .makedata2

prepare:
	@echo 'Mintifying LineageOS (Step 1/2)...'
	export MINTOS_DIR=`cat .makedata` MINTOS_DAT=`pwd` && cd $$MINTOS_DIR && mkdir -p .repo && mkdir -p .repo/local_manifests && cp $$MINTOS_DAT/99-mintos.xml ./.repo/local_manifests/
	make -f device/`cat .makedata2`/device.mk prepare

patch:
	@echo 'Mintifying LineageOS (Step 2/2)...'
	-export MINTOS_DIR=`cat .makedata` MINTOS_DAT=`pwd` && cd $$MINTOS_DIR && cd art && git apply -v $$MINTOS_DAT/01-art.patch && echo OK
	-export MINTOS_DIR=`cat .makedata` MINTOS_DAT=`pwd` && cd $$MINTOS_DIR && cd frameworks/base && git apply -v $$MINTOS_DAT/02-frameworks_base.patch && echo OK
	-export MINTOS_DIR=`cat .makedata` MINTOS_DAT=`pwd` && cd $$MINTOS_DIR && cd frameworks/base && git apply -v $$MINTOS_DAT/03-frameworks_base-2.patch && echo OK
	-export MINTOS_DIR=`cat .makedata` MINTOS_DAT=`pwd` && cd $$MINTOS_DIR && cd packages/apps/Updater && git apply -v $$MINTOS_DAT/04-updater.patch && echo OK
	-export MINTOS_DIR=`cat .makedata` MINTOS_DAT=`pwd` && cd $$MINTOS_DIR && cd packages/apps/Dialer && git apply -v $$MINTOS_DAT/05-dialer.patch && echo OK
	-make -f device/`cat .makedata2`/device.mk patch && echo OK

genota:
	export MINTOS_DIR=`cat .makedata` MINTOS_DAT=`pwd` MINTOS_DEVICE=`cat .makedata2` && chmod +x mkota-wrapper.sh && ./mkota-wrapper.sh $$MINTOS_DIR/out/target/product/$$MINTOS_DEVICE/lineage-17.1-*.zip $$MINTOS_DIR/out/target/product/$$MINTOS_DEVICE/ota_metadata $$MINTOS_DEVICE `(cd $$MINTOS_DIR/out/target/product/$$MINTOS_DEVICE && ls lineage-17.1-*.zip)`
