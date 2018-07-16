#include "hidestatusbaritems.h"

@implementation HideStatusBarItemsRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}

	return _specifiers;
}

-(void)twitterContactMethod {

	[[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"twitter:///user?screen_name=cchashmeetsingh"]];

}

-(void)githubContactMethod {

	[[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"https://github.com/chashmeetsingh"]];
	
}

-(void)paypalDonateMethod {

	[[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"https://www.paypal.me/chashmeet/1usd"]];
	
}

-(void)respring {
	killall SpringBoard;
}

@end
