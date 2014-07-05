ARCHS = armv7 armv7s arm64

TARGET = iphone:clang:latest:5.0

THEOS_BUILD_DIR = Packages
THEOS_DEVICE_IP = 192.168.0.12

include theos/makefiles/common.mk

TWEAK_NAME = MarkAsRead7
MarkAsRead7_CFLAGS = -fobjc-arc
MarkAsRead7_FILES = MarkAsRead7.xm
MarkAsRead7_FRAMEWORKS = Foundation UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

dylib:
	make
	scp -r $(THEOS_PROJECT_DIR)/$(TWEAK_NAME).plist root@$(THEOS_DEVICE_IP):/Library/MobileSubstrate/DynamicLibraries/
	scp -r $(THEOS_BUILD_DIR)/$(THEOS_OBJ_DIR_NAME)/$(TWEAK_NAME).dylib root@$(THEOS_DEVICE_IP):/Library/MobileSubstrate/DynamicLibraries/
	ssh root@$(THEOS_DEVICE_IP) 'killall backboardd'

after-install::
	install.exec "killall -9 backboardd"
