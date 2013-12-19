//
//  NSString+HTML.m
//  Bonybom
//
//  Created by Евгений on 05.09.13.
//  Copyright (c) 2013 Eugene. All rights reserved.
//

#import "NSString+HTML.h"

@implementation NSString (HTML)

+(NSString *)htmlspecialchars:(NSString *)string
{
    NSMutableString *encodedString = [NSMutableString stringWithString:string];
    
    encodedString = [NSMutableString stringWithString:[encodedString stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
    encodedString = [NSMutableString stringWithString:[encodedString stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"]];
    encodedString = [NSMutableString stringWithString:[encodedString stringByReplacingOccurrencesOfString:@"'" withString:@"&#039;"]];
    encodedString = [NSMutableString stringWithString:[encodedString stringByReplacingOccurrencesOfString:@"<" withString:@"&lt;"]];
    encodedString = [NSMutableString stringWithString:[encodedString stringByReplacingOccurrencesOfString:@">" withString:@"&gt;"]];
    
    return encodedString;
}

+(NSString *)urlencode:(NSString *)string
{
    NSMutableString *encodedString = [NSMutableString stringWithString:string];
    
    encodedString = [NSMutableString stringWithString:[encodedString stringByReplacingOccurrencesOfString:@"/" withString:@"%2F"]];
    encodedString = [NSMutableString stringWithString:[encodedString stringByReplacingOccurrencesOfString:@"$" withString:@"%24"]];
    encodedString = [NSMutableString stringWithString:[encodedString stringByReplacingOccurrencesOfString:@"&" withString:@"%26"]];
    encodedString = [NSMutableString stringWithString:[encodedString stringByReplacingOccurrencesOfString:@"'" withString:@"%27"]];
    encodedString = [NSMutableString stringWithString:[encodedString stringByReplacingOccurrencesOfString:@"\"" withString:@"%22"]];
    encodedString = [NSMutableString stringWithString:[encodedString stringByReplacingOccurrencesOfString:@"=" withString:@"%3D"]];
    encodedString = [NSMutableString stringWithString:[encodedString stringByReplacingOccurrencesOfString:@"<" withString:@"%3C"]];
    encodedString = [NSMutableString stringWithString:[encodedString stringByReplacingOccurrencesOfString:@">" withString:@"%3E"]];
    
    encodedString = [NSMutableString stringWithString:[encodedString stringByReplacingOccurrencesOfString:@"!" withString:@"%21"]];
    encodedString = [NSMutableString stringWithString:[encodedString stringByReplacingOccurrencesOfString:@"#" withString:@"%23"]];
    encodedString = [NSMutableString stringWithString:[encodedString stringByReplacingOccurrencesOfString:@"%" withString:@"%25"]];
    encodedString = [NSMutableString stringWithString:[encodedString stringByReplacingOccurrencesOfString:@"*" withString:@"%2A"]];
    encodedString = [NSMutableString stringWithString:[encodedString stringByReplacingOccurrencesOfString:@"," withString:@"%2C"]];
    encodedString = [NSMutableString stringWithString:[encodedString stringByReplacingOccurrencesOfString:@":" withString:@"%3A"]];
    encodedString = [NSMutableString stringWithString:[encodedString stringByReplacingOccurrencesOfString:@";" withString:@"%3B"]];
    encodedString = [NSMutableString stringWithString:[encodedString stringByReplacingOccurrencesOfString:@"[" withString:@"%5B"]];
    encodedString = [NSMutableString stringWithString:[encodedString stringByReplacingOccurrencesOfString:@"]" withString:@"%5D"]];
    encodedString = [NSMutableString stringWithString:[encodedString stringByReplacingOccurrencesOfString:@"^" withString:@"%5E"]];
    encodedString = [NSMutableString stringWithString:[encodedString stringByReplacingOccurrencesOfString:@"`" withString:@"%60"]];
    encodedString = [NSMutableString stringWithString:[encodedString stringByReplacingOccurrencesOfString:@"{" withString:@"%7B"]];
    encodedString = [NSMutableString stringWithString:[encodedString stringByReplacingOccurrencesOfString:@"|" withString:@"%7C"]];
    encodedString = [NSMutableString stringWithString:[encodedString stringByReplacingOccurrencesOfString:@"}" withString:@"%7D"]];
    encodedString = [NSMutableString stringWithString:[encodedString stringByReplacingOccurrencesOfString:@" " withString:@"%20"]];
    
    return encodedString;
}

+(NSString *)urldecode:(NSString *)string
{
    return (__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL, (CFStringRef)string, CFSTR(""), NSASCIIStringEncoding);;
}

@end
