//
//  TokenList.m
//  phase1
//
//  Created by wcyz666 on 15-3-19.
//  Copyright (c) 2015 wcyz666. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Token.h"
#import "TokenList.h"
@class Token;

@implementation TokenList

- (id)init {
    self = [super init];
    if (self){
        _list = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void) addToken: (Token *) token{
    [_list addObject: token];
}
- (TreeNode* ) parse{
    RepeatNode* root = [[RepeatNode alloc] init];
    root.number = [NSNumber numberWithInt:1];
    [self reset];
    while ([self hasMore]){
        [root addChildren:[[self nextToken] parse: self]];
    }
    return root;
}
// inner iterator
- (void) reset{
    _index = 0;
}

- (BOOL) hasMore {
    if (_index <= [_list count] - 1)
        return YES;
    else
        return NO;
}

- (Token*) nextToken{
    _index++;
    return _list[_index - 1];
}

@end

