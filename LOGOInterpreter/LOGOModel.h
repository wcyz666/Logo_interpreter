//
//  LOGOModel.h
//  LOGO Interpreter
//
//  Created by Chengpeng Qin on 16/3/15.
//  Copyright (c) 2015 Chengpeng Qin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>
#import "SourceCode.h"

@interface LOGOModel : NSObject

@property (nonatomic, strong) SourceCode *sourceCode;

- (void) setSourceCodeWithString: (NSString *)string;

- (NSBezierPath *)executeLOGO;   //generate instructions for drawing

@end
