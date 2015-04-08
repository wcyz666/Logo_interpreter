//
//  main.m
//  phase1
//
//  Created by wcyz666 on 15-2-21.
//  Copyright (c) 2015 wcyz666. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SourceCode.h"

int main(int argc, const char * argv[]) {
    SourceCode* sourceCode = [[SourceCode alloc] init];
    char _command[130];
    NSString* command;
    while (1) {
        memset(_command, 130, 1);
        fgets(_command, 128, stdin);
        size_t ln = strlen(_command) - 1;
        //Eat the trailing \n
        if (_command[ln] == '\n')
            _command[ln] = '\0';
        if (strlen(_command) == 0)
            continue;
        command = [NSString stringWithUTF8String:_command];
        sourceCode.code = command;
        @try {
            //[sourceCode tokenize];
            [[[sourceCode tokenize] parse] evaluate];
        }
        //tokenize the command, build the parse tree, print the output
        @catch (NSException *exception) {
            NSLog(@"%@: %@", [exception name], [exception reason]);
        }
        @finally {
        }
    }
}
