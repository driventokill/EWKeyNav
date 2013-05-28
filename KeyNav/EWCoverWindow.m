//
//  EWCoverWindow.m
//  KeyNav
//
//  Created by Fang Yang on 5/28/13.
//  Copyright (c) 2013 E-Worms. All rights reserved.
//

#import "EWCoverWindow.h"
#import "EWCrossView.h"

@implementation EWCoverWindow
{
    EWCrossView *_contentView;
}
- (id)init
{
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

- (id)initWithContentRect:(NSRect)contentRect styleMask:(NSUInteger)aStyle backing:(NSBackingStoreType)bufferingType defer:(BOOL)flag
{
    self = [super initWithContentRect:contentRect styleMask:aStyle backing:bufferingType defer:flag];
    if (self) {
        [self initialize];
    }
    return self;
}

- (id)initWithContentRect:(NSRect)contentRect styleMask:(NSUInteger)aStyle backing:(NSBackingStoreType)bufferingType defer:(BOOL)flag screen:(NSScreen *)screen
{
    self = [super initWithContentRect:contentRect styleMask:aStyle backing:bufferingType defer:flag screen:screen];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize
{
//    self.backgroundColor = [NSColor blackColor];
    self.backgroundColor = [NSColor clearColor];
    self.alphaValue = 0.5;
    self.level = CGShieldingWindowLevel();
    [self setReleasedWhenClosed:NO];
    
    _contentView = [[EWCrossView alloc] initWithFrame:NSMakeRect(0, 0, self.frame.size.width, self.frame.size.height)];
    [self setContentView:_contentView];
//    _contentView setback
}

- (void)dealloc
{
    [_contentView release];
    [super dealloc];
}

- (EWCrossView *)crossView
{
    return _contentView;
}
@end
