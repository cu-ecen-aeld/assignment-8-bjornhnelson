# LDD

LDD_VERSION = 05014e83df3205b72b1626f928bd53636c38c53c
LDD_SITE = git@github.com:cu-ecen-aeld/assignment-7-bjornhnelson.git
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

LDD_MODULE_SUBDIRS = misc-modules
LDD_MODULE_SUBDIRS += scull
LDD_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED)

define LDD_INSTALL_TARGET_CMDS
    $(INSTALL) -m 0700 $(@D)/scull/scull_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0700 $(@D)/scull/scull_unload $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0700 $(@D)/misc-modules/module_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0700 $(@D)/misc-modules/module_unload $(TARGET_DIR)/usr/bin
endef

$(eval $(kernel-module))
$(eval $(generic-package))
