//
//  SourceCode.m
//  phase1
//
//  Created by wcyz666 on 15-3-18.
//  Copyright (c) 2015 wcyz666. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SourceCode.h"
#import "SyntaxErrorException.h"
#import "TokenList.h"
#import "TokenDictionary.h"
#import "SyntaxTreeNode.h"

@interface SourceCode()

- (NSArray*) regexProcess: (NSString *) pattern;
@end

@implementation SourceCode

- (NSArray*) regexProcess: (NSString *) pattern{
    NSString* searched = _code;
    NSRange searchedRange = NSMakeRange(0, [searched length]);
    NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:nil];
    NSMutableArray* tokens = [[NSMutableArray alloc] init];
    for (NSTextCheckingResult* result in [regex matchesInString:searched options:0 range:searchedRange]){
        [tokens addObject:[_code substringWithRange:[result range]]];
    }
    //use regulation expression to detect correct tokens
    return tokens;
}

- (TokenList* ) tokenize{
    NSArray* tokenString = [self regexProcess:@"[\\[\\]]|[^ \\[\\]]*"];
    TokenList* tokenlist = [[TokenList alloc] init];
    for (NSString* tokenstr in tokenString){
        if ([tokenstr length] > 0)
            [tokenlist addToken:[TokenDictionary tokenFor:tokenstr]];
    }

    return tokenlist;

}
@end