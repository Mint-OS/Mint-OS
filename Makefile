setup:
	@echo LineageOS \(for $(MINTOS_DEVICE)\) location set to $(MINTOS_DIR)
	@echo "$(MINTOS_DIR)" > .makedata
	@echo "$(MINTOS_DEVICE)" > .makedata2
	@echo "$(MINTOS_OTA_DIR)" > .makedata3

prepare:
	@echo 'Mintifying LineageOS...'
	export MINTOS_DIR=`cat .makedata` MINTOS_DAT=`pwd` && cd $$MINTOS_DIR && mkdir -p .repo && mkdir -p .repo/local_manifests && cp $$MINTOS_DAT/99-mintos.xml ./.repo/local_manifests/
	make -f device/`cat .makedata2`/device.mk prepare

patch:
	@echo 'Mintifying LineageOS (Step 2/2)...'

genota:
	export MINTOS_DIR=`cat .makedata` MINTOS_DAT=`pwd` MINTOS_DEVICE=`cat .makedata2` && chmod +x mkota-wrapper.sh && ./mkota-wrapper.sh $$MINTOS_DIR/out/target/product/$$MINTOS_DEVICE/lineage-17.1-*.zip $$MINTOS_DIR/out/target/product/$$MINTOS_DEVICE/ota_metadata $$MINTOS_DEVICE `(cd $$MINTOS_DIR/out/target/product/$$MINTOS_DEVICE && ls lineage-17.1-*.zip)` `cat .makedata3`
