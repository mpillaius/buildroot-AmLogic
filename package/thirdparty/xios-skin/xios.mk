XIOS_VERSION = 2d1f23d9e4c3a3fc601d1c3b4cecf6f77cfa8d89
XIOS_SITE_METHOD = git
XIOS_SITE = git@github.com:Pivosgroup/skin.pivos.git
XIOS_INSTALL_STAGING = YES
XIOS_INSTALL_TARGET = YES
XIOS_DEPENDENCIES = xbmc
TEXTURE_PACKER=$(XBMC_DIR)/tools/TexturePacker/TexturePacker

define XIOS_BUILD_CMDS
	$(TEXTURE_PACKER) -use_none -i $(@D)/media -o $(@D)/media/Textures.xbt
endef

define XIOS_INSTALL_STAGING_CMDS
        mkdir -p $(STAGING_DIR)/usr/share/xbmc/addons/skin.xios
        cp -rf $(@D)/* $(STAGING_DIR)/usr/share/xbmc/addons/skin.xios/
endef

define XIOS_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/xbmc/addons/skin.xios/media
	cd $(@D); cp -rf `ls -I media -1` $(TARGET_DIR)/usr/share/xbmc/addons/skin.xios
	cp -f $(@D)/media/Textures.xbt $(TARGET_DIR)/usr/share/xbmc/addons/skin.xios/media
endef

$(eval $(call GENTARGETS,package/thirdparty,xios))
