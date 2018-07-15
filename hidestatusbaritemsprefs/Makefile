include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = hidestatusbaritemsprefs
hidestatusbaritemsprefs_FILES = HSBIRootListController.m
hidestatusbaritemsprefs_INSTALL_PATH = /Library/PreferenceBundles
hidestatusbaritemsprefs_FRAMEWORKS = UIKit
hidestatusbaritemsprefs_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/hidestatusbaritemsprefs.plist$(ECHO_END)
