//
//  MXAppDelegate.h
//  Coocodo
//
//  Created by Евгений on 27.11.13.
//  Copyright (c) 2013 Milax. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>
#import "MXWindow.h"
#import "MXHandler.h"
#import "MXCoocodoGetClientWindow.h"

@interface MXAppDelegate : NSObject <NSApplicationDelegate>
{
    MXHandler *handler;
    NSRect webViewFrame;
    BOOL canResize;
}

@property (assign) IBOutlet MXWindow *window;
@property (unsafe_unretained) IBOutlet MXWebViewWindow *webViewWindow;
@property (unsafe_unretained) IBOutlet MXCoocodoGetClientWindow *getClientWindow;
@property (weak) IBOutlet WebView *webView;
@property (weak) IBOutlet NSView *titleView;
@property (weak) IBOutlet NSMenu *dockMenu;
- (IBAction)didPressNewGetClient:(id)sender;
- (IBAction)didPressNewWebView:(id)sender;

@end