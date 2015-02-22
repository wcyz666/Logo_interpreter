//
//  StringSplitter.m
//  phase1
//
//  Created by wcyz666 on 15-2-21.
//  Copyright (c) 2015年 wcyz666. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StringSplitter.h"

@implementation StringSplitter

- (NSArray *) numbers{
    NSString *searchedString = _string;
    NSRange searchedRange = NSMakeRange(0, [searchedString length]);
    NSString *pattern = @"(^|(?<=[\\W_]))[0-9]+(?=[\\W_]|$)";
    NSError *error = nil;
    
    NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
    NSArray *results = [regex matchesInString:searchedString options:0 range: searchedRange];
    NSMutableArray *numbers = [[NSMutableArray alloc] init];
    for (NSTextCheckingResult *matchResult in results){
        [numbers addObject:[searchedString substringWithRange:[matchResult range]]];
    }
    return numbers;
}
- (NSArray *) words{
    NSString *searchedString = _string;
    NSRange searchedRange = NSMakeRange(0, [searchedString length]);
    NSString *pattern = @"(^|(?<=[\\W_]))[A-Za-z][A-Za-z0-9]*(?=[\\W_]|$)";
    NSError *error = nil;
    
    NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
    NSArray *results = [regex matchesInString:searchedString options:0 range: searchedRange];
    NSMutableArray *words = [[NSMutableArray alloc] init];
    for (NSTextCheckingResult *matchResult in results){
        [words addObject:[searchedString substringWithRange:[matchResult range]]];
    }
    return words;
}

- (NSArray *) wordsAndNumbers{
    NSString *searchedString = _string;
    NSRange searchedRange = NSMakeRange(0, [searchedString length]);
    NSString *pattern = @"(^|(?<=[\\W_]))(([A-Za-z][A-Za-z0-9]*)|([0-9]+))(?=[\\W_]|$)";
    NSError *error = nil;
    
    NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
    NSArray *results = [regex matchesInString:searchedString options:0 range: searchedRange];
    NSMutableArray *wordsAndNumbers = [[NSMutableArray alloc] init];
    for (NSTextCheckingResult *matchResult in results){
        [wordsAndNumbers addObject:[searchedString substringWithRange:[matchResult range]]];
    }
    return wordsAndNumbers;
}
@end