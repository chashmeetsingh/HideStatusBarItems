#line 1 "Tweak.xm"
#define kPath @"/var/mobile/Library/Preferences/HideStatusBarItems.plist"


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

#line 3 "Tweak.xm"


static BOOL _logos_method$_ungrouped$SBStatusBarStateAggregator$_setItem$enabled$(_LOGOS_SELF_TYPE_NORMAL SBStatusBarStateAggregator* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, int item, BOOL enableItem) {
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
	
	_logos_orig$_ungrouped$SBStatusBarStateAggregator$_setItem$enabled$(self, _cmd, item, enableItem);
	
    if (item == 33) {
        return _logos_orig$_ungrouped$SBStatusBarStateAggregator$_setItem$enabled$(self, _cmd, item, YES);
    }
    return _logos_orig$_ungrouped$SBStatusBarStateAggregator$_setItem$enabled$(self, _cmd, item, NO);
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SBStatusBarStateAggregator = objc_getClass("SBStatusBarStateAggregator"); MSHookMessageEx(_logos_class$_ungrouped$SBStatusBarStateAggregator, @selector(_setItem:enabled:), (IMP)&_logos_method$_ungrouped$SBStatusBarStateAggregator$_setItem$enabled$, (IMP*)&_logos_orig$_ungrouped$SBStatusBarStateAggregator$_setItem$enabled$);} }
#line 36 "Tweak.xm"
