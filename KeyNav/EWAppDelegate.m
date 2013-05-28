//
//  EWAppDelegate.m
//  KeyNav
//
//  Created by Fang Yang on 5/28/13.
//  Copyright (c) 2013 E-Worms. All rights reserved.
//

#import "EWAppDelegate.h"
#import "EWKeyNav.h"
#import "EWCoverWindow.h"
#import "EWCrossView.h"

@implementation EWAppDelegate

- (void)dealloc
{
    [self.statusItem release];
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    self.window.hidesOnDeactivate = YES;
    void (^handler) (NSEvent *event);
    handler  = ^(NSEvent *event) {
        self.window.backgroundColor = [NSColor blueColor];
        if ((event.modifierFlags & NSControlKeyMask) == NSControlKeyMask && event.keyCode == 41) { // ;
            [[EWKeyNav sharedInstance] coverScreen];
        }
        if (![[EWKeyNav sharedInstance] isActive]) {
            return;
        }
        if (event.keyCode == 53) { //esc
            [[EWKeyNav sharedInstance] removeCover];
        } else if (event.keyCode == 38) { //j
            [[EWKeyNav sharedInstance].coverWindow.crossView moveBottom];
        } else if (event.keyCode == 40) { //k
            [[EWKeyNav sharedInstance].coverWindow.crossView moveTop];
        } else if (event.keyCode == 37) { //l
            [[EWKeyNav sharedInstance].coverWindow.crossView moveRight];
        } else if (event.keyCode == 4) { //h
            [[EWKeyNav sharedInstance].coverWindow.crossView moveLeft];
        } else if (event.keyCode == 49) { //space
            [[EWKeyNav sharedInstance] clickScreen];
        }
        if ([[EWKeyNav sharedInstance].coverWindow.crossView isRegionEmpty]) {
            [[EWKeyNav sharedInstance] removeCover];
        }
        NSLog(@"keycode : %d", event.keyCode);
    };
    [NSEvent addGlobalMonitorForEventsMatchingMask:NSKeyDownMask handler:handler];
    [NSEvent addLocalMonitorForEventsMatchingMask:NSKeyDownMask handler:^(NSEvent *event){
        handler(event);
        return event;
    }];
    
    [self activeStatusMenu];
}

- (void)activeStatusMenu
{
    NSStatusBar *bar = [NSStatusBar systemStatusBar];
    self.statusItem = [bar statusItemWithLength:NSSquareStatusItemLength];
    self.statusItem.image = [NSImage imageNamed:@"icon-16.png"];
    self.statusItem.menu = self.mainMenu;
    self.statusItem.highlightMode = YES;
}
@end
