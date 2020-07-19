#include <stdio.h>

static void updateRoutes(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo)
{
	NSLog(@"iRoute: updateRoutes");
	// Update routes
	NSLog(@"iRoute: updateRoutes completed!");
}

int main(int argc, char *argv[], char *envp[]) {
	NSLog(@"iRoute: iRouted is launched!");
	CFNotificationCenterAddObserver(
		CFNotificationCenterGetDarwinNotifyCenter(),
		NULL,
		updateRoutes,
		CFSTR("me.izaacj.ios.iroute.update"),
		NULL,
		CFNotificationSuspensionBehaviorCoalesce
	);
	CFRunLoopRun();
	return 0;
}