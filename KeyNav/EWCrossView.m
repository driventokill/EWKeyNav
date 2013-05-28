//
//  EWCrossView.m
//  KeyNav
//
//  Created by Fang Yang on 5/28/13.
//  Copyright (c) 2013 E-Worms. All rights reserved.
//

#import "EWCrossView.h"

@implementation EWCrossView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.crossPointRatio = NSMakePoint(0.5, 0.5);
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    dirtyRect = [self bounds];
    [[NSColor redColor] set];
    [[self horizontalPath:dirtyRect] stroke];
    [[self verticalPath:dirtyRect] stroke];
}

- (NSBezierPath *)horizontalPath:(NSRect)rect
{
    NSBezierPath *horizontal = [NSBezierPath bezierPath];
    [horizontal moveToPoint:NSMakePoint(rect.origin.x, rect.origin.y + rect.size.height * self.crossPointRatio.y)];
    [horizontal lineToPoint:NSMakePoint(rect.origin.x + rect.size.width, rect.size.height * self.crossPointRatio.y)];
    horizontal.lineWidth = 1;
    return horizontal;
}

- (NSBezierPath *)verticalPath:(NSRect)rect
{
    NSBezierPath *vertical = [NSBezierPath bezierPath];
    [vertical moveToPoint:NSMakePoint(rect.origin.x + rect.size.width * self.crossPointRatio.x, rect.origin.y)];
    [vertical lineToPoint:NSMakePoint(rect.origin.x + rect.size.width * self.crossPointRatio.x, rect.origin.y + rect.size.height)];
    vertical.lineWidth = 1;
    return vertical;
}

- (NSPoint)crossPoint
{
    return NSMakePoint(self.bounds.origin.x + self.bounds.size.width * self.crossPointRatio.x,
                       self.bounds.origin.y + self.bounds.size.height * self.crossPointRatio.y);
}

@end
