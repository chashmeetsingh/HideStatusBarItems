#include "hidestatusbaritems.h"
#include <spawn.h>
#include <signal.h>

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
	//pid_t pid; 
	//int status; 
	//const char argv[] = {"killall", "SpringBoard", NULL}; 
	//posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char const*)argv, NULL); 
	//waitpid(pid, &status, WEXITED);
}

@end
