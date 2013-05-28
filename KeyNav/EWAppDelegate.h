//
//  EWAppDelegate.h
//  KeyNav
//
//  Created by Fang Yang on 5/28/13.
//  Copyright (c) 2013 E-Worms. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface EWAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSMenu *mainMenu;
@property (nonatomic, retain) NSStatusItem *statusItem;
@end
