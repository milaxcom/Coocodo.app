//
//  MXCoocodoGetClientWindow.h
//  Coocodo
//
//  Created by Евгений on 19.12.13.
//  Copyright (c) 2013 Milax. All rights reserved.
//

#import "MXWindow.h"
#import <WebKit/WebKit.h>

@interface MXCoocodoGetClientWindow : MXWindow <NSWindowDelegate>

@property (strong) IBOutlet WebView *webView;

-(void)loadRequest:(NSString*)urlString;

@end
