//
//  EWCrossView.h
//  KeyNav
//
//  Created by Fang Yang on 5/28/13.
//  Copyright (c) 2013 E-Worms. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface EWCrossView : NSView
@property (nonatomic, assign) NSPoint crossPointRatio;
- (NSPoint)crossPoint;
@end
