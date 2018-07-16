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
		switch (item) {
			case 1:
				if (dndSwitch == YES) {
					return %orig(item, NO);
				}
			case 2:
				if (airplaneModeSwitch == YES) {
					return %orig(item, NO);
				}
			case 3:
				if (signalStrengthSwitch == YES) {
					return %orig(item, NO);
				}
			case 4:
				if (carrierTextSwitch == YES) {
					return %orig(item, NO);
				}
			case 6:
				if (wifiSwitch == YES) {
					return %orig(item, NO);
				}
			case 8:
				if (batteryIconSwitch == YES) {
					return %orig(item, NO);
				}
			case 9:
				if (batteryTextSwitch == YES) {
					return %orig(item, NO);
				}
			case 12:
				if (bluetoothSwitch == YES) {
					return %orig(item, NO);
				}
			case 14:
				if (alarmSwitch == YES) {
					return %orig(item, NO);
				}
			case 17:
				if (locationSwitch == YES) {
					return %orig(item, NO);
				}
			case 18:
				if (orientationLockSwitch == YES) {
					return %orig(item, NO);
				}
			case 20:
				if (screenMirroringSwitch == YES) {
					return %orig(item, NO);
				}
			case 24:
				if (vpnSwitch == YES) {
					return %orig(item, NO);
				}
			default: 
				return %orig;
		}
	}

	return %orig;
}

%end

static void notificationCallback(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) {	
	
	NSNumber *a = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"dndSwitch" inDomain:domainString];
	dndSwitch = (a)? [a boolValue]:NO;

	NSNumber *b = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"airplaneModeSwitch" inDomain:domainString];
	airplaneModeSwitch = (b)? [b boolValue]:NO;

	NSNumber *c = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"signalStrengthSwitch" inDomain:domainString];
	signalStrengthSwitch = (c)? [c boolValue]:NO;

	NSNumber *d = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"carrierTextSwitch" inDomain:domainString];
	carrierTextSwitch = (d)? [d boolValue]:NO;

	NSNumber *e = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"wifiSwitch" inDomain:domainString];
	wifiSwitch = (e)? [e boolValue]:NO;

	NSNumber *f = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"batteryIconSwitch" inDomain:domainString];
	batteryIconSwitch = (f)? [f boolValue]:NO;

	NSNumber *g = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"batteryTextSwitch" inDomain:domainString];
	batteryTextSwitch = (g)? [g boolValue]:NO;

	NSNumber *h = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"bluetoothSwitch" inDomain:domainString];
	bluetoothSwitch = (h)? [h boolValue]:NO;

	NSNumber *i = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"alarmSwitch" inDomain:domainString];
	alarmSwitch = (i)? [i boolValue]:NO;

	NSNumber *j = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"locationSwitch" inDomain:domainString];
	locationSwitch = (j)? [j boolValue]:NO;

	NSNumber *k = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"orientationLockSwitch" inDomain:domainString];
	orientationLockSwitch = (k)? [k boolValue]:NO;

	NSNumber *l = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"screenMirroringSwitch" inDomain:domainString];
	screenMirroringSwitch = (l)? [l boolValue]:NO;

	NSNumber *m = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"vpnSwitch" inDomain:domainString];
	vpnSwitch = (m)? [m boolValue]:NO;

	NSNumber *n = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"enableTweak" inDomain:domainString];
	enableTweak = (n)? [n boolValue]:NO;
}

%ctor {
		
	NSAutoreleasePool *pool = [NSAutoreleasePool new];
	//set initial `enable' variable
	notificationCallback(NULL, NULL, NULL, NULL, NULL);

	//register for notifications
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, notificationCallback, (CFStringRef)notificationString, NULL, CFNotificationSuspensionBehaviorCoalesce);
	[pool release];
}