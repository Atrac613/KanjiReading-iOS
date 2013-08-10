WORKSPACE = KanjiReading.xcworkspace
SCHEME = KanjiReading

clean:
	xctool \
		-workspace $(WORKSPACE) \
		-scheme $(SCHEME) \
		clean

test:
	xctool \
		-workspace $(WORKSPACE) \
		-scheme $(SCHEME) \
		ONLY_ACTIVE_ARCH=NO \
		build \
		test \
		-test-sdk iphonesimulator6.0
