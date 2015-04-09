//
//  TokenDictionary.m
//  phase1
//
//  Created by wcyz666 on 15-3-19.
//  Copyright (c) 2015 wcyz666. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TokenDictionary.h"
#import "Token.h"
#import "SyntaxErrorException.h"

@interface TokenDictionary()

+ (BOOL) isInt: (NSString* ) toCheck;
@end

@implementation TokenDictionary

+ (BOOL) isInt: (NSString* ) toCheck {
    NSScanner* scan = [NSScanner scannerWithString:toCheck];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

+ (Token *) tokenFor:(NSString *)tokenString{
    Token* token;
    if ([tokenString isEqualToString:@"PU"]){
        token = [[PUToken alloc] init];
    }
    else if ([tokenString isEqualToString:@"PD"]){
        token = [[PDToken alloc] init];
    }
    else if ([tokenString isEqualToString:@"CS"]){
        token = [[CSToken alloc] init];
    }
    else if ([tokenString isEqualToString:@"BK"]){
        token = [[BKToken alloc] init];
    }
    else if ([tokenString isEqualToString:@"FD"]){
        token = [[FDToken alloc] init];
    }
    
    else if ([tokenString isEqualToString:@"LT"]){
        token = [[LTToken alloc] init];
    }
    else if ([tokenString isEqualToString:@"RT"]){
        token = [[RTToken alloc] init];
    }
    else if ([tokenString isEqualToString:@"REPEAT"]){
        token = [[RepeatToken alloc] init];
    }
    else if ([tokenString isEqualToString:@"["]){
        token = [[BeginBlockToken alloc] init];
    }
    else if ([tokenString isEqualToString:@"]"]){
        token = [[EndBlockToken alloc] init];
    }
    else if ([tokenString isEqualToString:@"MAKE"]){
        token = [[MakeToken alloc] init];
    }
    else if ([tokenString isEqualToString:@"SET"]){
        token = [[SetToken alloc] init];
    }
    else if ([tokenString isEqualToString:@"ADD"]){
        token = [[AddToken alloc] init];
    }
    else if ([tokenString isEqualToString:@"SUB"]){
        token = [[SubToken alloc] init];
    }
    else if ([tokenString isEqualToString:@"WHILE"]){
        token = [[WhileToken alloc] init];
    }
    else if ([tokenString isEqualToString:@"ST"] || [tokenString isEqualToString:@"EQ"] || [tokenString isEqualToString:@"GT"]){
        token = [[CmpToken alloc] init];
        token.value = tokenString;
    }
    else if ([self isInt:tokenString]){
        NSNumberFormatter* nf = [[NSNumberFormatter alloc] init];
        nf.numberStyle = NSNumberFormatterDecimalStyle;
        
        token = [[NumberToken alloc] init];
        token.value = [nf numberFromString:tokenString];
    }
    else {
        NSString * pattern = @"^[a-zA-Z][a-zA-Z\\d]*$";
        NSPredicate* test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
        if ([test evaluateWithObject:tokenString]){
            token = [[VarToken alloc] init];
            token.value = tokenString;
        }
        else{
            NSException* myException = [SyntaxErrorException exceptionWithName:@"SyntaxError" reason:@"Unknown Token!" userInfo:nil];
            @throw myException;
        }
    }
    
    return token;
}

@end