TARGET := iphone:clang:latest:7.0

include $(THEOS)/makefiles/common.mk

TOOL_NAME = iroute

iRoute_FILES = main.m
iRoute_CFLAGS = -fobjc-arc
iRoute_CODESIGN_FLAGS = -Sentitlements.plist
iRoute_INSTALL_PATH = /usr/local/bin

include $(THEOS_MAKE_PATH)/tool.mk
SUBPROJECTS += iroute
include $(THEOS_MAKE_PATH)/aggregate.mk

after-install::
	install.exec "uicache; killall -9 SpringBoard;"