//
//  EWAppDelegate.m
//  KeyNav
//
//  Created by Fang Yang on 5/28/13.
//  Copyright (c) 2013 E-Worms. All rights reserved.
//

#import "EWAppDelegate.h"
#import "EWKeyNav.h"

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
//        NSLog(@":;;;;;:::::::::::;;;::")
        if ((event.modifierFlags & NSShiftKeyMask) == NSShiftKeyMask && event.keyCode == 41) { // ;
            [[EWKeyNav sharedInstance] coverScreen];
        } else if (event.keyCode == 53) { //esc
            [[EWKeyNav sharedInstance] removeCover];
        }
    
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
