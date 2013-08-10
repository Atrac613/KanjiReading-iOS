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
		-sdk iphonesimulator \
		VALID_ARCHS=i386 \
		build \
		test 
