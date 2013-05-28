//
//  EWCoverWindow.h
//  KeyNav
//
//  Created by Fang Yang on 5/28/13.
//  Copyright (c) 2013 E-Worms. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface EWCoverWindow : NSWindow
- (void)splitForLocation;
- (void)moveLeft;
- (void)moveRight;
- (void)moveTop;
- (void)moveBottom;
- (NSPoint *)currentPoint;
@end
