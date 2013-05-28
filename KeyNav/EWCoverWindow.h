//
//  EWCoverWindow.h
//  KeyNav
//
//  Created by Fang Yang on 5/28/13.
//  Copyright (c) 2013 E-Worms. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class EWCrossView;
@interface EWCoverWindow : NSWindow
- (NSPoint *)currentPoint;
- (EWCrossView *)crossView;
@end
