#define kPath @"/var/mobile/Library/Preferences/HideStatusBarItems.plist"

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
    
	//NSDictionary *prefs=[[NSDictionary alloc] initWithContentsOfFile:kPath];
	%orig;
	
    if (item == 33) {
        return %orig(item, YES);
    }
    return %orig(item, NO);
}

%end