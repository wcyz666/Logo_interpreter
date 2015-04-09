//
//  TokenList.h
//  phase1
//
//  Created by wcyz666 on 15-3-15.
//  Copyright (c) 2015 wcyz666. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Token.h"
#import "SyntaxTreeNode.h"
@class Token;


@interface TokenList : NSObject{}

@property (nonatomic) NSMutableArray* list;
@property (nonatomic) int index;
- (void) addToken: (Token *) token;
- (void) reset;
- (Token *) nextToken;
- (BOOL) hasMore;
- (TreeNode* ) parse;

@end
