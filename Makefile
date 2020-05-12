prepare:
	echo Mintifying LineageOS at $(MINTOS_DIR)
	export MINTOS_DAT=`pwd` && cd $(MINTOS_DIR) && mkdir -p .repo && mkdir -p .repo/local_manifests && cp $$MINTOS_DAT/99-mintos.xml ./.repo/local_manifests/ && cd art && git apply $$MINTOS_DAT/01-art.patch
