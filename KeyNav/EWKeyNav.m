//
//  EWKeyNav.m
//  KeyNav
//
//  Created by Fang Yang on 5/28/13.
//  Copyright (c) 2013 E-Worms. All rights reserved.
//

#import "EWKeyNav.h"
#import "EWCoverWindow.h"
@implementation EWKeyNav
static EWKeyNav *instance = nil;

- (id)init
{
    self = [super init];
    if (self) {
        _coverWindow = [[EWCoverWindow alloc] initWithContentRect:[NSScreen mainScreen].frame
                                                   styleMask:NSBorderlessWindowMask
                                                     backing:NSBackingStoreNonretained
                                                       defer:NO];
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
    [self.coverWindow makeKeyAndOrderFront:self];
}

- (void)removeCover
{
    [self.coverWindow close];
}

- (void)clickScreen
{
    
}

@end
