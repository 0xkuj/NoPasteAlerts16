export TARGET = iphone:clang:14.5:14.5
INSTALL_TARGET_PROCESSES = SpringBoard
ARCHS = arm64 arm64e
GO_EASY_ON_ME = 1
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = NoPasteAlerts16

NoPasteAlerts16_FILES = Tweak.xm
NoPasteAlerts16_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
