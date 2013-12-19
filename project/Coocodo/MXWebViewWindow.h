//
//  MXWebViewWindow.h
//  Coocodo
//
//  Created by Евгений on 18.12.13.
//  Copyright (c) 2013 Milax. All rights reserved.
//

#import "MXWindow.h"
#import <WebKit/WebKit.h>

@interface MXWebViewWindow : MXWindow <NSWindowDelegate>
{
    BOOL canResize;
    NSRect webViewFrame;
}

@property (nonatomic, strong) IBOutlet WebView *webView;
@property (strong) IBOutlet NSView *dropView;
@property (weak) IBOutlet NSTextField *wh;

- (IBAction)didPressRefreshButton:(id)sender;
-(void)loadRequest:(NSString*)urlString;

@end
