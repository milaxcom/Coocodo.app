//
//  MXAppDelegate.m
//  Coocodo
//
//  Created by Евгений on 27.11.13.
//  Copyright (c) 2013 Milax. All rights reserved.
//

#import "MXAppDelegate.h"
#import "NSString+HTML.h"

@implementation MXAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    handler = [[MXHandler alloc] init];
    webViewFrame = _webViewWindow.frame;
    
    canResize = NO;
    
    _titleView.frame = self.webViewWindow.titleBarView.bounds;
    //_titleView.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
    [self.webViewWindow.titleBarView addSubview:self.titleView];
    
    [[NSAppleEventManager sharedAppleEventManager] setEventHandler:self
                                                       andSelector:@selector(getUrl:withReplyEvent:)
                                                     forEventClass:kInternetEventClass
                                                        andEventID:kAEGetURL];
    [_webViewWindow loadRequest:@"reset"];
    [_getClientWindow loadRequest:@"reset"];
}

- (void)getUrl:(NSAppleEventDescriptor *)event withReplyEvent:(NSAppleEventDescriptor *)replyEvent
{
    [_getClientWindow.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"get.add('?%@');", [[event paramDescriptorForKeyword:keyDirectObject] stringValue]]];
    [handler handleURL:[[event paramDescriptorForKeyword:keyDirectObject]
                        stringValue]];
}

- (IBAction)didPressNewGetClient:(id)sender {
    [_getClientWindow loadRequest:@"reset"];
}

- (IBAction)didPressNewWebView:(id)sender {
    [_webViewWindow loadRequest:@"reset"];
}

@end