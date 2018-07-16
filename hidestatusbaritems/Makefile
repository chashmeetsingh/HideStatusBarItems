ARCHS = armv7 armv7s arm64
TARGET = iphone::9.3:9.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = HideStatusBarItems
HideStatusBarItems_FILES = hidestatusbaritems.m
HideStatusBarItems_INSTALL_PATH = /Library/PreferenceBundles
HideStatusBarItems_FRAMEWORKS = UIKit
HideStatusBarItems_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/HideStatusBarItems.plist$(ECHO_END)
