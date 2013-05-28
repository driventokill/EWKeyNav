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
        _crossRegion = self.bounds;
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    [[NSColor redColor] set];
    [[self horizontalPath:_crossRegion] stroke];
    [[self verticalPath:_crossRegion] stroke];
    [[self border:_crossRegion] stroke];
}

- (NSBezierPath *)border:(NSRect)region
{
    NSBezierPath *path = [NSBezierPath bezierPath];
    [path moveToPoint:NSMakePoint(region.origin.x, region.origin.y)];
    [path lineToPoint:NSMakePoint(region.origin.x + region.size.width, region.origin.y)];
    [path lineToPoint:NSMakePoint(region.origin.x + region.size.width, region.origin.y + region.size.height)];
    [path lineToPoint:NSMakePoint(region.origin.x, region.origin.y + region.size.height)];
    [path closePath];
    path.lineWidth = 1;
    path.lineCapStyle = NSSquareLineCapStyle;
    return path;
}

- (NSBezierPath *)horizontalPath:(NSRect)rect
{
    NSBezierPath *horizontal = [NSBezierPath bezierPath];
    [horizontal moveToPoint:NSMakePoint(rect.origin.x, rect.origin.y + rect.size.height * self.crossPointRatio.y)];
    [horizontal lineToPoint:NSMakePoint(rect.origin.x + rect.size.width, rect.origin.y + rect.size.height * self.crossPointRatio.y)];
    horizontal.lineWidth = 1;
    horizontal.lineCapStyle = NSRoundLineCapStyle;
    return horizontal;
}

- (NSBezierPath *)verticalPath:(NSRect)rect
{
    NSBezierPath *vertical = [NSBezierPath bezierPath];
    [vertical moveToPoint:NSMakePoint(rect.origin.x + rect.size.width * self.crossPointRatio.x, rect.origin.y)];
    [vertical lineToPoint:NSMakePoint(rect.origin.x + rect.size.width * self.crossPointRatio.x, rect.origin.y + rect.size.height)];
    vertical.lineWidth = 1;
    vertical.lineCapStyle = NSRoundLineCapStyle;
    return vertical;
}

- (NSPoint)crossPoint
{
    return NSMakePoint(self.crossRegion.origin.x + self.crossRegion.size.width * self.crossPointRatio.x,
                       self.crossRegion.origin.y + self.crossRegion.size.height * self.crossPointRatio.y);
}

- (BOOL)isRegionEmpty
{
    return self.crossRegion.size.width < 4 || self.crossRegion.size.height < 4;
}

- (void)moveLeft
{
    _crossRegion = NSMakeRect(_crossRegion.origin.x, _crossRegion.origin.y, _crossRegion.size.width/2, _crossRegion.size.height);
    [self setNeedsDisplay:YES];

}

- (void)moveTop
{
    NSLog(@"begin cross region: %.2f %.2f %.2f %.2f", _crossRegion.origin.x, _crossRegion.origin.y, _crossRegion.size.width, _crossRegion.size.height);
    _crossRegion = NSMakeRect(_crossRegion.origin.x, _crossRegion.origin.y+_crossRegion.size.height/2, _crossRegion.size.width, _crossRegion.size.height / 2);
    NSLog(@"end cross region: %.2f %.2f %.2f %.2f", _crossRegion.origin.x, _crossRegion.origin.y, _crossRegion.size.width, _crossRegion.size.height);
    [self setNeedsDisplay:YES];
}

- (void)moveRight
{
    _crossRegion = NSMakeRect(_crossRegion.origin.x + _crossRegion.size.width / 2, _crossRegion.origin.y, _crossRegion.size.width/2, _crossRegion.size.height);
    [self setNeedsDisplay:YES];
}

- (void)moveBottom
{
    _crossRegion = NSMakeRect(_crossRegion.origin.x, _crossRegion.origin.y, _crossRegion.size.width, _crossRegion.size.height/2);
    [self setNeedsDisplay:YES];
}

- (void)resetRegion
{
    _crossRegion = self.bounds;
    [self setNeedsDisplay:YES];
}

@end
