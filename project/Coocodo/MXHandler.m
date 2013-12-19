//
//  MXHandler.m
//  Bonybom
//
//  Created by Евгений on 27.11.13.
//  Copyright (c) 2013 Milax. All rights reserved.
//

#import "MXHandler.h"
#import "MXAppDelegate.h"
#import "NSString+HTML.h"
#import "MXWebViewWindow.h"

static MXAppDelegate *appDelegate;

@implementation MXHandler

-(id)init
{
    self = [super init];
    if (self)
    {
        appDelegate = (MXAppDelegate *) [[NSApplication sharedApplication] delegate];
    }
    return self;
}

-(void)handleURL:(NSString *)url
{
    NSLog(@"mxhandler: %@", url);
    
    if ([url isEqualToString:@"coocodo://refresh-coocodo"])
    {
        [appDelegate.webViewWindow didPressRefreshButton:self];
        return;
    }
    
    NSMutableDictionary *data = [self toDictionary:url];
    
    // окна
    if ([[data valueForKey:@"cocoaHtmlAction"] isEqualToString:@"windows"])
    {
        if ([data valueForKey:@"go"] != nil)
        {
            [appDelegate.webViewWindow loadRequest:[data valueForKey:@"go"]];
        }
    }
    
}
#pragma mark - private methods

-(NSMutableDictionary *)toDictionary:(NSString *)string
{
    NSMutableDictionary *dataComponents = [[NSMutableDictionary alloc] init];
    NSArray *components = [[string stringByReplacingOccurrencesOfString:@"bonybom://?" withString:@""] componentsSeparatedByString:@"&"];
    for (NSString *component in components)
    {
        NSArray *separated = [component componentsSeparatedByString:@"="];
        [dataComponents setValue:[separated objectAtIndex:1] forKey:[separated objectAtIndex:0]];
    }
    
    return dataComponents;
}

@end