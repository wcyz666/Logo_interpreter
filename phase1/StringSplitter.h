//
//  StringSplitter.h
//  phase1
//
//  Created by wcyz666 on 15-2-21.
//  Copyright (c) 2015年 wcyz666. All rights reserved.
//

#ifndef phase1_StringSplitter_h
#define phase1_StringSplitter_h

#endif

#import <Foundation/Foundation.h>

@interface StringSplitter : NSObject{}
@property (nonatomic, copy) NSString* string;
- (NSArray *) words;
- (NSArray *) numbers;
- (NSArray *) wordsAndNumbers;
@end
