#line 1 "Tweak.xm"
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


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class SBStatusBarStateAggregator; 
static BOOL (*_logos_orig$_ungrouped$SBStatusBarStateAggregator$_setItem$enabled$)(_LOGOS_SELF_TYPE_NORMAL SBStatusBarStateAggregator* _LOGOS_SELF_CONST, SEL, int, BOOL); static BOOL _logos_method$_ungrouped$SBStatusBarStateAggregator$_setItem$enabled$(_LOGOS_SELF_TYPE_NORMAL SBStatusBarStateAggregator* _LOGOS_SELF_CONST, SEL, int, BOOL); 

#line 27 "Tweak.xm"


static BOOL _logos_method$_ungrouped$SBStatusBarStateAggregator$_setItem$enabled$(_LOGOS_SELF_TYPE_NORMAL SBStatusBarStateAggregator* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, int item, BOOL enableItem) {
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

	if (enableTweak == YES) {
		switch (item) {
			case 1:
				if (dndSwitch == YES) {
					return _logos_orig$_ungrouped$SBStatusBarStateAggregator$_setItem$enabled$(self, _cmd, item, NO);
				}
			case 2:
				if (airplaneModeSwitch == YES) {
					return _logos_orig$_ungrouped$SBStatusBarStateAggregator$_setItem$enabled$(self, _cmd, item, NO);
				}
			case 3:
				if (signalStrengthSwitch == YES) {
					return _logos_orig$_ungrouped$SBStatusBarStateAggregator$_setItem$enabled$(self, _cmd, item, NO);
				}
			case 4:
				if (carrierTextSwitch == YES) {
					return _logos_orig$_ungrouped$SBStatusBarStateAggregator$_setItem$enabled$(self, _cmd, item, NO);
				}
			case 6:
				if (wifiSwitch == YES) {
					return _logos_orig$_ungrouped$SBStatusBarStateAggregator$_setItem$enabled$(self, _cmd, item, NO);
				}
			case 8:
				if (batteryIconSwitch == YES) {
					return _logos_orig$_ungrouped$SBStatusBarStateAggregator$_setItem$enabled$(self, _cmd, item, NO);
				}
			case 9:
				if (batteryTextSwitch == YES) {
					return _logos_orig$_ungrouped$SBStatusBarStateAggregator$_setItem$enabled$(self, _cmd, item, NO);
				}
			case 12:
				if (bluetoothSwitch == YES) {
					return _logos_orig$_ungrouped$SBStatusBarStateAggregator$_setItem$enabled$(self, _cmd, item, NO);
				}
			case 14:
				if (alarmSwitch == YES) {
					return _logos_orig$_ungrouped$SBStatusBarStateAggregator$_setItem$enabled$(self, _cmd, item, NO);
				}
			case 17:
				if (locationSwitch == YES) {
					return _logos_orig$_ungrouped$SBStatusBarStateAggregator$_setItem$enabled$(self, _cmd, item, NO);
				}
			case 18:
				if (orientationLockSwitch == YES) {
					return _logos_orig$_ungrouped$SBStatusBarStateAggregator$_setItem$enabled$(self, _cmd, item, NO);
				}
			case 20:
				if (screenMirroringSwitch == YES) {
					return _logos_orig$_ungrouped$SBStatusBarStateAggregator$_setItem$enabled$(self, _cmd, item, NO);
				}
			case 24:
				if (vpnSwitch == YES) {
					return _logos_orig$_ungrouped$SBStatusBarStateAggregator$_setItem$enabled$(self, _cmd, item, NO);
				}
			default: 
				return _logos_orig$_ungrouped$SBStatusBarStateAggregator$_setItem$enabled$(self, _cmd, item, enableItem);
		}
	}

	return _logos_orig$_ungrouped$SBStatusBarStateAggregator$_setItem$enabled$(self, _cmd, item, enableItem);
}



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

static __attribute__((constructor)) void _logosLocalCtor_1aadaca9(int __unused argc, char __unused **argv, char __unused **envp) {
		
	NSAutoreleasePool *pool = [NSAutoreleasePool new];
	
	notificationCallback(NULL, NULL, NULL, NULL, NULL);

	
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, notificationCallback, (CFStringRef)notificationString, NULL, CFNotificationSuspensionBehaviorCoalesce);
	[pool release];
}
static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SBStatusBarStateAggregator = objc_getClass("SBStatusBarStateAggregator"); MSHookMessageEx(_logos_class$_ungrouped$SBStatusBarStateAggregator, @selector(_setItem:enabled:), (IMP)&_logos_method$_ungrouped$SBStatusBarStateAggregator$_setItem$enabled$, (IMP*)&_logos_orig$_ungrouped$SBStatusBarStateAggregator$_setItem$enabled$);} }
#line 169 "Tweak.xm"
