ARCHS = armv7 armv7s arm64

TARGET = iphone:clang:latest:5.0

THEOS_BUILD_DIR = Packages

include theos/makefiles/common.mk

TWEAK_NAME = MarkAsRead7
MarkAsRead7_CFLAGS = -fobjc-arc
MarkAsRead7_FILES = MarkAsRead7.xm
MarkAsRead7_FRAMEWORKS = Foundation UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 backboardd"
