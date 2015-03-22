//
//  SourceCode.h
//  phase1
//
//  Created by wcyz666 on 15-3-18.
//  Copyright (c) 2015年 wcyz666. All rights reserved.
//

#ifndef phase1_SourceCode_h
#define phase1_SourceCode_h


#endif

#import <Foundation/Foundation.h>
#import "TokenList.h"

@interface SourceCode : NSObject {}
@property (nonatomic, copy) NSString* code;
- (TokenList*) tokenize;

@end
