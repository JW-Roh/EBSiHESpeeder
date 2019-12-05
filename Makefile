ARCHS := armv7 armv7s arm64 arm64e
TARGET := iphone:clang:12.2:9.3

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = EBSiHESpeeder
$(TWEAK_NAME)_FILES = Tweak.xm
$(TWEAK_NAME)_EXTRA_FRAMEWORKS += Cephei
$(TWEAK_NAME)_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += EBSiHESpeederPrefs
include $(THEOS_MAKE_PATH)/aggregate.mk
