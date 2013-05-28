//
//  EWKeyNav.h
//  KeyNav
//
//  Created by Fang Yang on 5/28/13.
//  Copyright (c) 2013 E-Worms. All rights reserved.
//

#import <Foundation/Foundation.h>
@class EWCoverWindow;
@interface EWKeyNav : NSObject
@property (nonatomic, readonly) EWCoverWindow *coverWindow;
+ (EWKeyNav *)sharedInstance;
- (void)coverScreen;
- (void)removeCover;
- (void)clickScreen;
- (BOOL)isActive;
@end
