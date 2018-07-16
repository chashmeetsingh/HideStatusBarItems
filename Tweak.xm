#include <CoreFoundation/CFNotificationCenter.h>
#import <Foundation/NSUserDefaults.h>

static NSString *domainString = @"com.chashmeet.hidestatusbaritems";
static NSString *notificationString = @"com.chashmeet.hidestatusbaritems/preferences.changed";

@interface NSUserDefaults (UFS_Category)
- (id)objectForKey:(NSString *)key inDomain:(NSString *)domain;
- (void)setObject:(id)value forKey:(NSString *)key inDomain:(NSString *)domain;
@end

static BOOL dndSwitch = NO;
static BOOL airplaneModeSwitch = NO;
static BOOL signalStrengthSwitch = NO;
static BOOL carrierTextSwitch = NO;
static BOOL wifiSwitch = NO;
static BOOL batteryIconSwitch = NO;
static BOOL batteryTextSwitch = NO;
static BOOL bluetoothSwitch = NO;
static BOOL alarmSwitch = NO;
static BOOL locationSwitch = NO;
static BOOL orientationLockSwitch = NO;
static BOOL screenMirroringSwitch = NO;
static BOOL vpnSwitch = NO;
static BOOL enableTweak = NO;

%hook SBStatusBarStateAggregator

-(BOOL)_setItem:(int)item enabled:(BOOL)enableItem {
    // 1: DND
    // 2: Airplane Mode
    // 3: Mobile Signal
    // 4: Carrier Text
    // 6: WiFi icon
    // 8: Battery icon
    // 9: Battery % text
    // 10: Battery % text same?
    // 11: Something related to battery
    // 12: Bluetooth icon
    // 13: Phone and key icon?
    // 14: Alarm icon
    // 17: Location icon
    // 18: Orientation lock icon
    // 20: Screen mirroring icon
    // 22: Related to audio
    // 24: VPN icon
    // 25: Related to call outward icon
    // 27: Black square icon

	if (enableTweak == YES) {
		NSLog(@"Tweak enabled");

		switch (item) {
			case 1:
				NSLog(@"dndSwitch %d", dndSwitch);
				if (dndSwitch == YES) {
					return %orig(item, NO);
				}
			case 2:
				NSLog(@"airplaneModeSwitch %d", airplaneModeSwitch);
				if (airplaneModeSwitch == YES) {
					return %orig(item, NO);
				}
			case 3:
				NSLog(@"signalStrengthSwitch %d", signalStrengthSwitch);
				if (signalStrengthSwitch == YES) {
					return %orig(item, NO);
				}
			case 4:
				NSLog(@"carrierTextSwitch %d", carrierTextSwitch);
				if (carrierTextSwitch == YES) {
					return %orig(item, NO);
				}
			case 6:
				NSLog(@"wifiSwitch %d", wifiSwitch);
				if (wifiSwitch == YES) {
					return %orig(item, NO);
				}
			case 8:
				NSLog(@"batteryIconSwitch %d", batteryIconSwitch);
				if (batteryIconSwitch == YES) {
					return %orig(item, NO);
				}
			case 9:
				NSLog(@"batteryTextSwitch %d", batteryTextSwitch);
				if (batteryTextSwitch == YES) {
					return %orig(item, NO);
				}
			case 12:
				NSLog(@"bluetoothSwitch %d", bluetoothSwitch);
				if (bluetoothSwitch == YES) {
					return %orig(item, NO);
				}
			case 14:
				NSLog(@"alarmSwitch %d", alarmSwitch);
				if (alarmSwitch == YES) {
					return %orig(item, NO);
				}
			case 17:
				NSLog(@"locationSwitch %d", locationSwitch);
				if (locationSwitch == YES) {
					return %orig(item, NO);
				}
			case 18:
				NSLog(@"orientationLockSwitch %d", orientationLockSwitch);
				if (orientationLockSwitch == YES) {
					return %orig(item, NO);
				}
			case 20:
				NSLog(@"screenMirroringSwitch %d", screenMirroringSwitch);
				if (screenMirroringSwitch == YES) {
					return %orig(item, NO);
				}
			case 24:
				NSLog(@"vpnSwitch %d", vpnSwitch);
				if (vpnSwitch == YES) {
					return %orig(item, NO);
				}
			default: 
				return %orig;
		}
	}
	NSLog(@"Tweak disabled");

	return %orig;
}

%end

static void notificationCallback(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) {	
	
	NSNumber *a = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"dndSwitch" inDomain:domainString];
	dndSwitch = [a boolValue];

	NSNumber *b = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"airplaneModeSwitch" inDomain:domainString];
	airplaneModeSwitch = [b boolValue];

	NSNumber *c = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"signalStrengthSwitch" inDomain:domainString];
	signalStrengthSwitch = [c boolValue];

	NSNumber *d = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"carrierTextSwitch" inDomain:domainString];
	carrierTextSwitch = [d boolValue];

	NSNumber *e = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"wifiSwitch" inDomain:domainString];
	wifiSwitch = [e boolValue];

	NSNumber *f = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"batteryIconSwitch" inDomain:domainString];
	batteryIconSwitch = [f boolValue];

	NSNumber *g = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"batteryTextSwitch" inDomain:domainString];
	batteryTextSwitch = [g boolValue];

	NSNumber *h = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"bluetoothSwitch" inDomain:domainString];
	bluetoothSwitch = [h boolValue];

	NSNumber *i = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"alarmSwitch" inDomain:domainString];
	alarmSwitch = [i boolValue];

	NSNumber *j = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"locationSwitch" inDomain:domainString];
	locationSwitch = [j boolValue];

	NSNumber *k = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"orientationLockSwitch" inDomain:domainString];
	orientationLockSwitch = [k boolValue];

	NSNumber *l = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"screenMirroringSwitch" inDomain:domainString];
	screenMirroringSwitch = [l boolValue];

	NSNumber *m = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"vpnSwitch" inDomain:domainString];
	vpnSwitch = [m boolValue];

	NSNumber *n = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"enableTweak" inDomain:domainString];
	enableTweak = [n boolValue];

	NSLog(@"dndSwitch update %d", dndSwitch);
	NSLog(@"airplaneModeSwitch update %d", airplaneModeSwitch);
	NSLog(@"signalStrengthSwitch update %d", signalStrengthSwitch);
	NSLog(@"carrierTextSwitch update %d", carrierTextSwitch);
	NSLog(@"wifiSwitch update %d", wifiSwitch);
	NSLog(@"batteryIconSwitch update %d", batteryIconSwitch);
	NSLog(@"batteryTextSwitch update %d", batteryTextSwitch);
	NSLog(@"bluetoothSwitch update %d", bluetoothSwitch);
	NSLog(@"alarmSwitch update %d", alarmSwitch);
	NSLog(@"locationSwitch update %d", locationSwitch);
	NSLog(@"orientationLockSwitch update %d", orientationLockSwitch);
	NSLog(@"vpnSwiscreenMirroringSwitch update %d", vpnSwitch);
	NSLog(@"vpnSwitch update %d", vpnSwitch);
	NSLog(@"enableTweak %d", enableTweak);
}

%ctor {
		
	NSAutoreleasePool *pool = [NSAutoreleasePool new];
	//set initial `enable' variable
	notificationCallback(NULL, NULL, NULL, NULL, NULL);

	//register for notifications
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, notificationCallback, (CFStringRef)notificationString, NULL, CFNotificationSuspensionBehaviorCoalesce);
	[pool release];
}