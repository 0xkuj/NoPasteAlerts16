#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface SBUserNotificationAlert : NSObject
- (void)_setActivated:(BOOL)activated;
- (void)_sendResponseAndCleanUp:(BOOL)cleanup;
@end

%hook SBAlertItem
+ (void)activateAlertItem:(id)arg1 {
	id alertItem = arg1;
	if ([alertItem isKindOfClass:NSClassFromString(@"SBUserNotificationAlert")]) {
	    NSString *str = MSHookIvar<NSString *>(alertItem, "_alertSource");
	    if ([str isEqualToString:@"pasted"]) {
	        [alertItem _setActivated:NO];
	        if ([alertItem respondsToSelector:@selector(_sendResponseAndCleanUp:)]) {
                    [alertItem _sendResponseAndCleanUp:YES];
	        }
		return;
	    }
	}
	%orig(alertItem);
}
%end
