TARGET := iphone:clang:latest:7.0
INSTALL_TARGET_PROCESSES = iRoute

include $(THEOS)/makefiles/common.mk

APPLICATION_NAME = iRoute

iRoute_FILES = main.m izaAppDelegate.m izaRootViewController.m izaRouteCell.m
iRoute_FRAMEWORKS = UIKit CoreGraphics
iRoute_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/application.mk
