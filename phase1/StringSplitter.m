//
//  StringSplitter.m
//  phase1
//
//  Created by wcyz666 on 15-2-21.
//  Copyright (c) 2015 wcyz666. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StringSplitter.h"

@implementation StringSplitter

- (NSArray *) numbers{

    NSArray *results = [self regexProcess:@"(^|(?<=[\\W_]))\\d+(?=[\\W_]|$)"];

    NSMutableArray *numbers = [[NSMutableArray alloc] init];
    for (NSTextCheckingResult *matchResult in results){
        [numbers addObject:[NSNumber numberWithFloat:[[_string substringWithRange:[matchResult range]] floatValue]]];
    }
    return numbers;
}
- (NSArray *) words{

    NSArray *results = [self regexProcess:@"(^|(?<=[\\W_]))[A-Za-z][A-Za-z\\d]*(?=[\\W_]|$)"];

    NSMutableArray *words = [[NSMutableArray alloc] init];
    for (NSTextCheckingResult *matchResult in results){
        [words addObject:[_string substringWithRange:[matchResult range]]];
    }
    return words;
}

- (NSArray *) wordsAndNumbers{

	NSArray *results = [self regexProcess:@"(^|(?<=[\\W_]))(([A-Za-z][A-Za-z\\d]*)|\\d+)(?=[\\W_]|$)"];
	
    NSMutableArray *wordsAndNumbers = [[NSMutableArray alloc] init];
    for (NSTextCheckingResult *matchResult in results){
		NSString* tmp = [_string substringWithRange:[matchResult range]];
		if ([tmp characterAtIndex:0] >= '0' && [tmp characterAtIndex:0] <= '9' )
			[wordsAndNumbers addObject:[NSNumber numberWithFloat:[tmp floatValue]]];
		else
			[wordsAndNumbers addObject:tmp];
    }
    return wordsAndNumbers;
}

- (NSArray *) regexProcess: (NSString*) pattern{
	NSString *searchedString = _string;
    NSRange searchedRange = NSMakeRange(0, [searchedString length]);
    NSError *error = nil;
    
    NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
    return [regex matchesInString:searchedString options:0 range: searchedRange];
}
@end