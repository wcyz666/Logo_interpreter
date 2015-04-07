//
//  Token.h
//  phase1
//
//  Created by wcyz666 on 15-3-15.
//  Copyright (c) 2015 wcyz666. All rights reserved.
//


#ifndef phase2_Token_h
#define phase2_Token_h

#endif

#import <Foundation/Foundation.h>
#import "SyntaxTreeNode.h"
#import "TokenList.h"
@class TokenList;

@interface Token : NSObject {}

@property (nonatomic, copy) NSObject* value;
- (TreeNode* ) parse : (TokenList *) tokenList;

@end

@interface BeginBlockToken : Token
@end

@interface EndBlockToken : Token
@end

@interface NumberToken : Token
@end

@interface CSToken : Token
@end

@interface BKToken : Token
@end

@interface PUToken : Token
@end

@interface FDToken : Token
@end

@interface PDToken : Token
@end

@interface LTToken : Token
@end

@interface RTToken : Token
@end

@interface MakeToken : Token
@end

@interface VarToken : Token
@end

@interface RepeatToken : Token
@end

