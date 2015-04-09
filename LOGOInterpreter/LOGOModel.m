//
//  LOGOModel.m
//  LOGO Interpreter
//
//  Created by Chengpeng Qin on 16/3/15.
//  Copyright (c) 2015 Chengpeng Qin. All rights reserved.
//

#import "LOGOModel.h"


@implementation LOGOModel

-(id) init{
    self = [super init];
    if (self)
        _sourceCode = [[SourceCode alloc] init];
    return self;
}

- (void) setSourceCodeWithString: (NSString *)string{

    _sourceCode.code = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    //set source code with argument string
    
}

- (NSBezierPath *)executeLOGO{
    NSBezierPath *path = [NSBezierPath bezierPath];

    Position* pos= [[Position alloc] init];
    
    [path removeAllPoints];
    [path moveToPoint:CGPointMake(pos.x, pos.y)];
    
    @try {
        //[sourceCode tokenize];
        [[[_sourceCode tokenize] parse] evaluate:path forPosition:pos];
        return path;
    }
    //tokenize the command, build the parse tree, print the output
    @catch (NSException *exception) {
        NSLog(@"%@: %@", [exception name], [exception reason]);
    }
    //execute the LOGO source code
    
}

@end
