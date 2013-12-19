//
//  NSString+HTML.h
//  Bonybom
//
//  Created by Евгений on 05.09.13.
//  Copyright (c) 2013 Eugene. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (HTML)

+(NSString *)htmlspecialchars:(NSString *)string;
+(NSString *)urlencode:(NSString *)string;
+(NSString *)urldecode:(NSString *)string;

@end
