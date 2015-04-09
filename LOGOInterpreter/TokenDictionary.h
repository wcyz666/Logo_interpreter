//
//  TokenDictionaty.h
//  phase1
//
//  Created by wcyz666 on 15-3-19.
//  Copyright (c) 2015 wcyz666. All rights reserved.
//

#ifndef phase1_TokenDictionary_h
#define phase1_TokenDictionary_h


#endif

#import <Foundation/Foundation.h>
#import "Token.h"

@interface TokenDictionary : NSObject{}

+ (Token* ) tokenFor: (NSString *) tokenString;

@end