//
//  EWKeyNav.m
//  KeyNav
//
//  Created by Fang Yang on 5/28/13.
//  Copyright (c) 2013 E-Worms. All rights reserved.
//

#import "EWKeyNav.h"
#import "EWCoverWindow.h"
#import "EWCrossView.h"
@implementation EWKeyNav
{
    BOOL _isActive;
}
static EWKeyNav *instance = nil;

- (id)init
{
    self = [super init];
    if (self) {
        _coverWindow = [[EWCoverWindow alloc] initWithContentRect:[NSScreen mainScreen].frame
                                                   styleMask:NSBorderlessWindowMask
                                                     backing:NSBackingStoreNonretained
                                                       defer:NO];
        [_coverWindow setIgnoresMouseEvents:NO];
        _isActive = NO;
    }
    return self;
}

- (void)dealloc
{
    [self.coverWindow release];
    [super dealloc];
}

+ (EWKeyNav *)sharedInstance
{
    @synchronized(self){
        if (instance == nil) {
            instance = [[EWKeyNav alloc] init];
        }
        return instance;
    }
}

- (void)coverScreen
{
    NSPoint mouseLoc;
    mouseLoc = [NSEvent mouseLocation];
    NSArray *screens = [NSScreen screens];
    for (NSScreen *screen in screens) {
        if (CGRectContainsPoint(NSRectToCGRect(screen.frame), NSPointToCGPoint(mouseLoc))) {
            [self.coverWindow setFrame:screen.frame display:YES];
            break;
        }
    }

    [[NSApplication sharedApplication] resignFirstResponder];
    [self.coverWindow.crossView resetRegion];
    [self.coverWindow makeKeyAndOrderFront:self];
    _isActive = YES;
}

- (void)removeCover
{
//    [[NSApplication sharedApplication] hide:self];
    [[NSApplication sharedApplication] resignFirstResponder];
    [self.coverWindow close];
    _isActive = NO;
}

- (void)clickScreen
{
    [self removeCover];
    NSPoint mouseWarpLocation = NSMakePoint(self.coverWindow.frame.origin.x + self.coverWindow.crossView.crossPoint.x,
                                            self.coverWindow.frame.origin.y + self.coverWindow.crossView.crossPoint.y);
    CGPoint pt = CGPointMake(mouseWarpLocation.x, self.coverWindow.frame.size.height - mouseWarpLocation.y);
    
    CGEventSourceRef evsrc = CGEventSourceCreate(kCGEventSourceStateCombinedSessionState);
    CGEventSourceSetLocalEventsSuppressionInterval(evsrc, 0.0);
    CGAssociateMouseAndMouseCursorPosition (0);
    CGWarpMouseCursorPosition(pt);
    CGAssociateMouseAndMouseCursorPosition (1);
    
}

- (BOOL)isActive
{
    return _isActive;
}

@end
