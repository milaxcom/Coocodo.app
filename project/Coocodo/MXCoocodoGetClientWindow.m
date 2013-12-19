//
//  MXCoocodoGetClientWindow.m
//  Coocodo
//
//  Created by Евгений on 19.12.13.
//  Copyright (c) 2013 Milax. All rights reserved.
//

#import "MXCoocodoGetClientWindow.h"
#import "NSString+HTML.h"

@implementation MXCoocodoGetClientWindow

-(id)initWithContentRect:(NSRect)contentRect styleMask:(NSUInteger)aStyle backing:(NSBackingStoreType)bufferingType defer:(BOOL)flag
{
    self = [super initWithContentRect:contentRect styleMask:aStyle backing:bufferingType defer:flag];
    
    if (self)
    {
        self.minimizeButton = nil;
        self.zoomButton = nil;
        
        [_webView setUIDelegate:self];
        [_webView setEditingDelegate:self];
        [_webView setPolicyDelegate:self];
        [_webView setFrameLoadDelegate:self];
        [_webView setResourceLoadDelegate:self];
    }
    
    return self;
}

-(void)loadRequest:(NSString*)urlString
{
    if ([urlString isEqualToString:@"reset"])
    {
        NSURL *url = [NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"get" ofType:@"html"]];
        [[_webView mainFrame] loadRequest:[NSURLRequest requestWithURL:url]];
    }
    else
    {
        NSLog(@"loading request: %@", [NSString urldecode:urlString]);
        NSURL *url = [NSURL URLWithString:[NSString urldecode:urlString]];
        [[_webView mainFrame] loadRequest:[NSURLRequest requestWithURL:url]];
    }
}

@end
