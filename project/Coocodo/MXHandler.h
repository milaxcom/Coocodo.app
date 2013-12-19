//
//  MXHandler.h
//  Bonybom
//
//  Created by Евгений on 27.11.13.
//  Copyright (c) 2013 Milax. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MXWebViewWindow.h"

@interface MXHandler : NSObject <NSApplicationDelegate>

-(void)handleURL:(NSString *)url;

@end