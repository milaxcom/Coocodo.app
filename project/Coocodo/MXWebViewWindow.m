//
//  MXWebViewWindow.m
//  Coocodo
//
//  Created by Евгений on 18.12.13.
//  Copyright (c) 2013 Milax. All rights reserved.
//

#import "MXWebViewWindow.h"
#import "NSString+HTML.h"


@implementation MXWebViewWindow

-(id)initWithContentRect:(NSRect)contentRect styleMask:(NSUInteger)aStyle backing:(NSBackingStoreType)bufferingType defer:(BOOL)flag
{
    self = [super initWithContentRect:contentRect styleMask:aStyle backing:bufferingType defer:flag];
    
    if (self)
    {
        webViewFrame = self.frame;
        canResize = NO;
        
        [_webView setUIDelegate:self];
        [_webView setEditingDelegate:self];
        [_webView setPolicyDelegate:self];
        [_webView setFrameLoadDelegate:self];
        [_webView setResourceLoadDelegate:self];
    }
    
    return self;
}

-(NSSize)windowWillResize:(NSWindow *)sender toSize:(NSSize)frameSize
{
    if (canResize) [_wh setStringValue:[NSString stringWithFormat:@"w %i h %i (%i)", (int) frameSize.width, (int) frameSize.height, (int) frameSize.height - 25]];
    return (canResize) ? frameSize : self.frame.size ;
}

- (IBAction)didPressRefreshButton:(id)sender {
    [[_webView mainFrame] reload];
}

-(void)loadRequest:(NSString*)urlString
{
    if ([urlString isEqualToString:@"reset"])
    {
        NSURL *url = [NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"webview" ofType:@"html"]];
        [[_webView mainFrame] loadRequest:[NSURLRequest requestWithURL:url]];
        [self setFrame:webViewFrame display:YES];
        [_wh setStringValue:[NSString stringWithFormat:@"w %i h %i (%i)", (int) webViewFrame.size.width, (int) webViewFrame.size.height, (int) webViewFrame.size.height - 25]];
        canResize = NO;
    }
    else
    {
        NSLog(@"loading request: %@", [NSString urldecode:urlString]);
        NSURL *url = [NSURL URLWithString:[NSString urldecode:urlString]];
        [[_webView mainFrame] loadRequest:[NSURLRequest requestWithURL:url]];
        canResize = YES;
    }
}

- (NSURLRequest *)webView:(WebView *)sender resource:(id)identifier willSendRequest:(NSURLRequest *)request redirectResponse:(NSURLResponse *)redirectResponse fromDataSource:(WebDataSource *)dataSource {
    request = [NSURLRequest requestWithURL:[request URL] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:[request timeoutInterval]];
    return request;
}

@end
