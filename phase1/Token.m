
//
//  Token.m
//  phase1
//
//  Created by wcyz666 on 15-3-19.
//  Copyright (c) 2015 wcyz666. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Token.h"
#import "TokenList.h"
#import "SyntaxErrorException.h"
#import "VariableTable.h"
@implementation Token

- (TreeNode* ) parse:(TokenList *)tokenList{
    return nil;
}

@end

@implementation BeginBlockToken

- (TreeNode* ) parse:(TokenList *)tokenList{
    NSException* myException = [SyntaxErrorException exceptionWithName:@"SyntaxError" reason:@"Redundant left bracket!" userInfo:nil];
    @throw myException;
    
}@end

@implementation EndBlockToken

- (TreeNode* ) parse:(TokenList *)tokenList{
    NSException* myException = [SyntaxErrorException exceptionWithName:@"SyntaxError" reason:@"Redundant right bracket!" userInfo:nil];
    @throw myException;
}
@end

@implementation NumberToken

- (TreeNode* ) parse:(TokenList *)tokenList{
    NSException* myException = [SyntaxErrorException exceptionWithName:@"SyntaxError" reason:@"Redundant number" userInfo:nil];
    @throw myException;
}
@end

@implementation CSToken
- (TreeNode* ) parse:(TokenList *)tokenList{
    return [[CSNode alloc] init];
}
@end

@implementation BKToken

- (TreeNode* ) parse:(TokenList *)tokenList{
    BKNode* fd = [[BKNode alloc] init];
    if ([tokenList hasMore]){
        Token* token = [tokenList nextToken];
        if ([token isKindOfClass:[NumberToken class]]){
            fd.number = (NSNumber*) token.value;
        }
        else{
            NSException* myException = [SyntaxErrorException exceptionWithName:@"SyntaxError" reason:@"Lack Number!" userInfo:nil];
            @throw myException;
        }
    }
    else{
        NSException* myException = [SyntaxErrorException exceptionWithName:@"SyntaxError" reason:@"Lack Number!" userInfo:nil];
        @throw myException;
    }
    return fd;
}
@end

@implementation PUToken

- (TreeNode* ) parse:(TokenList *)tokenList{
    return [[PUNode alloc] init];
}
@end

@implementation PDToken

- (TreeNode* ) parse:(TokenList *)tokenList{
    return [[PDNode alloc] init];
}
@end

@implementation FDToken

- (TreeNode* ) parse:(TokenList *)tokenList{
    FDNode* fd = [[FDNode alloc] init];
    if ([tokenList hasMore]){
        Token* token = [tokenList nextToken];
        if ([token isKindOfClass:[NumberToken class]]){
            fd.number = (NSNumber*) token.value;
        }
        else{
            NSException* myException = [SyntaxErrorException exceptionWithName:@"SyntaxError" reason:@"Lack Number!" userInfo:nil];
            @throw myException;
        }
    }
    else{
        NSException* myException = [SyntaxErrorException exceptionWithName:@"SyntaxError" reason:@"Lack Number!" userInfo:nil];
        @throw myException;
    }
    return fd;
}
@end


@implementation RTToken

- (TreeNode* ) parse:(TokenList *)tokenList{
    RTNode* fd = [[RTNode alloc] init];
    if ([tokenList hasMore]){
        Token* token = [tokenList nextToken];
        if ([token isKindOfClass:[NumberToken class]]){
            fd.number = (NSNumber*) token.value;
        }
        else{
            NSException* myException = [SyntaxErrorException exceptionWithName:@"SyntaxError" reason:@"Lack Number!" userInfo:nil];
            @throw myException;
        }
    }
    else{
        NSException* myException = [SyntaxErrorException exceptionWithName:@"SyntaxError" reason:@"Lack Number!" userInfo:nil];
        @throw myException;
    }
    return fd;
}
@end

@implementation LTToken

- (TreeNode* ) parse:(TokenList *)tokenList{
    LTNode* fd = [[LTNode alloc] init];
    if ([tokenList hasMore]){
        Token* token = [tokenList nextToken];
        if ([token isKindOfClass:[NumberToken class]]){
            fd.number = (NSNumber*) token.value;
        }
        else{
            NSException* myException = [SyntaxErrorException exceptionWithName:@"SyntaxError" reason:@"Lack Number!" userInfo:nil];
            @throw myException;
        }
    }
    else{
        NSException* myException = [SyntaxErrorException exceptionWithName:@"SyntaxError" reason:@"Lack Number!" userInfo:nil];
        @throw myException;
    }
    return fd;
}
@end

@interface RepeatNode()

- (void) validateRepeat: (TokenList*) tokenList repeatNode: (RepeatNode *) repeatNode;

@end

@implementation RepeatToken

- (void) validateRepeat: (TokenList*) tokenList repeatNode: (RepeatNode *) repeatNode{
    
    if ([tokenList hasMore]){
        Token* token = [tokenList nextToken];
        if ([token isKindOfClass:[NumberToken class]]){
            repeatNode.number = (NSNumber*) token.value;
        }
        else{
            NSException* myException = [SyntaxErrorException exceptionWithName:@"SyntaxError" reason:@"Lack Number!" userInfo:nil];
            @throw myException;
        }
    }
    else{
        NSException* myException = [SyntaxErrorException exceptionWithName:@"SyntaxError" reason:@"Lack Number!" userInfo:nil];
        @throw myException;
    }
    
    if ([tokenList hasMore]){
        Token* token = [tokenList nextToken];
        if (NO == [token isKindOfClass:[BeginBlockToken class]]){
            NSException* myException = [SyntaxErrorException exceptionWithName:@"SyntaxError" reason:@"Repeat command should be followed by left bracket!" userInfo:nil];
            @throw myException;
        }
    }
    else{
        NSException* myException = [SyntaxErrorException exceptionWithName:@"SyntaxError" reason:@"Repeat command should be followed by left bracket!" userInfo:nil];
        @throw myException;
    }
}

- (TreeNode* ) parse:(TokenList *)tokenList{
    int recur = 1;
    RepeatNode* repeatRoot = [[RepeatNode alloc] init];
    NSMutableArray* repeatStack = [[NSMutableArray alloc] init];
    [repeatStack addObject:repeatRoot];
    
    //Use Array to simulate Stack structure.
    //The Last element is the current root
    //This algorithm allows for arbitrary deep layers.
    
    
    RepeatNode* currentRoot = repeatRoot;
    
    [self validateRepeat:tokenList repeatNode:repeatRoot];
    
    while (true){
        if (NO == [tokenList hasMore]){
            NSException* myException = [SyntaxErrorException exceptionWithName:@"SyntaxError" reason:@"Unmatched brackets!" userInfo:nil];
            @throw myException;
        }
        Token* token = [tokenList nextToken];
        if ([token isKindOfClass:[EndBlockToken class]]){
            --recur;
            if (!recur)
                break;
            else {
                [repeatStack removeLastObject];
                currentRoot = [repeatStack lastObject];
            }
        }
        else if ([token isKindOfClass:[RepeatNode class]]){
            ++recur;
            RepeatNode* newNode = [[RepeatNode alloc] init];
            [self validateRepeat:tokenList repeatNode:newNode];
            [repeatStack addObject: newNode];
            currentRoot = newNode;
        }
        else{
            [currentRoot addChildren:[token parse:tokenList]];
        }
        
    }
    return repeatRoot;
}

@end


@implementation MakeToken

- (TreeNode* ) parse:(TokenList *)tokenList{
    MakeNode* fd = [[MakeNode alloc] init];
    if ([tokenList hasMore]){
        Token* token = [tokenList nextToken];
        if ([token isKindOfClass:[VarToken class]]){
            fd.name = (NSString *) token.value;
        }
        else{
            NSException* myException = [SyntaxErrorException exceptionWithName:@"SyntaxError" reason:@"Lack Variable name!" userInfo:nil];
            @throw myException;
        }
    }
    else{
        NSException* myException = [SyntaxErrorException exceptionWithName:@"SyntaxError" reason:@"Lack Variable name!" userInfo:nil];
        @throw myException;
    }
    return fd;
}
@end


@implementation SetToken

- (TreeNode* ) parse:(TokenList *)tokenList{
    SetNode* fd = [[SetNode alloc] init];
    if ([tokenList hasMore]){
        Token* token = [tokenList nextToken];
        if ([token isKindOfClass:[VarToken class]]){
            fd.name = (NSString *) token.value;
            if ([tokenList hasMore]){
                Token* token = [tokenList nextToken];
                if ([token isKindOfClass:[VarToken class]]){
                    fd.anoName = (NSString *) token.value;
                    fd.isVar = YES;
                }
                else if ([token isKindOfClass:[NumberToken class]]){
                    fd.value = (NSNumber *) token.value;
                    fd.isVar = NO;
                }
                else{
                    NSException* myException = [SyntaxErrorException exceptionWithName:@"SyntaxError" reason:@"Lack another Variable name or number!" userInfo:nil];
                    @throw myException;
                }
            }
            else{
                NSException* myException = [SyntaxErrorException exceptionWithName:@"SyntaxError" reason:@"Lack another Variable name or number!" userInfo:nil];
                @throw myException;
            }
            
        }
        else{
            NSException* myException = [SyntaxErrorException exceptionWithName:@"SyntaxError" reason:@"Lack Variable name!" userInfo:nil];
            @throw myException;
        }
    }
    else{
        NSException* myException = [SyntaxErrorException exceptionWithName:@"SyntaxError" reason:@"Lack Variable name!" userInfo:nil];
        @throw myException;
    }
    return fd;
}
@end

@implementation VarToken

- (TreeNode* ) parse:(TokenList *)tokenList{
    NSException* myException = [SyntaxErrorException exceptionWithName:@"SyntaxError" reason:@"Redundant variables" userInfo:nil];
    @throw myException;
}
@end