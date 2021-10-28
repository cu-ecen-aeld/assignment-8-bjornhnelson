
##############################################################
#
# AESD-CHAR_DRIVER
#
##############################################################

AESD_CHAR_DRIVER_VERSION = 31eedd30239e08154a55342e07d06fe719b643b0
AESD_CHAR_DRIVER_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-bjornhnelson.git
AESD_CHAR_DRIVER_SITE_METHOD = git
AESD_CHAR_DRIVER_GIT_SUBMODULES = YES
AESD_CHAR_DRIVER_MODULE_SUBDIRS = aesd-char-driver

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app all
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server all
endef

define AESD_CHAR_DRIVER_INSTALL_TARGET_CMDS
    $(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_unload $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment8/* $(TARGET_DIR)/usr/bin
endef

$(eval $(kernel-module))
$(eval $(generic-package))