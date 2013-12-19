//
//  MXWindow.m
//  Bonybom
//
//  Created by Евгений on 29.11.13.
//  Copyright (c) 2013 Milax. All rights reserved.
//

#import "MXWindow.h"

@implementation MXWindow

-(id)initWithContentRect:(NSRect)contentRect styleMask:(NSUInteger)aStyle backing:(NSBackingStoreType)bufferingType defer:(BOOL)flag
{
    self = [super initWithContentRect:contentRect styleMask:aStyle backing:bufferingType defer:flag];
    if (self)
    {
        [self setupButtons];
        // The class of the window has been set in INAppStoreWindow in Interface Builder
        self.trafficLightButtonsLeftMargin = 8.0;
        self.trafficLightButtonsTopMargin = 5.0;
        self.trafficLightSeparation = 5.0;
        self.titleBarHeight = 25.0;
        self.verticallyCenterTitle = YES;
        
        self.titleFont = [NSFont fontWithName:@"Helvetica Neue" size:13];
        
        self.titleBarStartColor = [self colorFromHexRGB:@"fdfdfd"];
        self.titleBarEndColor = [self colorFromHexRGB:@"fdfdfd"];
        
        self.inactiveTitleBarStartColor = self.titleBarStartColor;
        self.inactiveTitleBarEndColor = self.titleBarEndColor;
        
        self.backgroundColor = [self colorFromHexRGB:@"fdfdfd"];
        self.showsBaselineSeparator = NO;
        
        self.showsTitle = YES;
    }
    return self;
}

#pragma mark - private methods

-(void)setupButtons
{
    INWindowButton *closeButton = [INWindowButton windowButtonWithSize:NSMakeSize(12, 12) groupIdentifier:nil];
    closeButton.activeImage = [NSImage imageNamed:@"close_regular"];
    closeButton.activeNotKeyWindowImage = [NSImage imageNamed:@"close_regular"];
    closeButton.inactiveImage = [NSImage imageNamed:@"close_regular"];
    closeButton.pressedImage = [NSImage imageNamed:@"close_hover"];
    closeButton.rolloverImage = [NSImage imageNamed:@"close_hover"];
    self.closeButton = closeButton;
    
    INWindowButton *minimizeButton = [INWindowButton windowButtonWithSize:NSMakeSize(12, 12) groupIdentifier:nil];
    minimizeButton.activeImage = [NSImage imageNamed:@"rollup_regular"];
    minimizeButton.activeNotKeyWindowImage = [NSImage imageNamed:@"rollup_regular"];
    minimizeButton.inactiveImage = [NSImage imageNamed:@"rollup_regular"];
    minimizeButton.pressedImage = [NSImage imageNamed:@"rollup_hover"];
    minimizeButton.rolloverImage = [NSImage imageNamed:@"rollup_hover"];
    self.minimizeButton = minimizeButton;
    
    INWindowButton *zoomButton = [INWindowButton windowButtonWithSize:NSMakeSize(12, 12) groupIdentifier:nil];
    zoomButton.activeImage = [NSImage imageNamed:@"fullscreen_regular"];
    zoomButton.activeNotKeyWindowImage = [NSImage imageNamed:@"fullscreen_regular"];
    zoomButton.inactiveImage = [NSImage imageNamed:@"fullscreen_regular"];
    zoomButton.pressedImage = [NSImage imageNamed:@"fullscreen_hover"];
    zoomButton.rolloverImage = [NSImage imageNamed:@"fullscreen_hover"];
    self.zoomButton = zoomButton;
}

- (NSColor *) colorFromHexRGB:(NSString *) inColorString
{
	NSColor *result = nil;
	unsigned int colorCode = 0;
	unsigned char redByte, greenByte, blueByte;
	
	if (nil != inColorString)
	{
		NSScanner *scanner = [NSScanner scannerWithString:inColorString];
		(void) [scanner scanHexInt:&colorCode];	// ignore error
	}
	redByte		= (unsigned char) (colorCode >> 16);
	greenByte	= (unsigned char) (colorCode >> 8);
	blueByte	= (unsigned char) (colorCode);	// masks off high bits
	result = [NSColor
              colorWithCalibratedRed:		(float)redByte	/ 0xff
              green:	(float)greenByte/ 0xff
              blue:	(float)blueByte	/ 0xff
              alpha:1.0];
	return result;
}

@end
