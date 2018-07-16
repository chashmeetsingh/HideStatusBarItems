ARCHS = armv7 armv7s arm64
TARGET = iphone::9.3:9.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = HideStatusBarItems
HideStatusBarItems_FILES = Tweak.xm
HideStatusBarItems_PRIVATE_FRAMEWORKS = AppSupport

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += hidestatusbaritems
include $(THEOS_MAKE_PATH)/aggregate.mk
