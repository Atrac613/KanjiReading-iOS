WORKSPACE = KanjiReading.xcworkspace
SCHEME = KanjiReading

clean:
	xcodebuild \
		-workspace $(WORKSPACE) \
		-scheme $(SCHEME) \
		clean

test:
	xcodebuild \
		-workspace $(WORKSPACE) \
		-scheme $(SCHEME) \
		-sdk iphonesimulator \
		-configuration Debug \
		TEST_AFTER_BUILD=YES \
		ONLY_ACTIVE_ARCH=NO
