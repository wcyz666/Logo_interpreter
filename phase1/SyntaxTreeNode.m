//
//  TreeNode.m
//  phase2
//
//  Created by Jialiang Zhao on 18/3/15.
//  Copyright (c) 2015 Jialiang Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SyntaxTreeNode.h"
#import "VariableTable.h"

// object node for output of each command, the parent obj is TreeNode
@implementation TreeNode

- (id) init{
    self = [super init];
    if (self){
        _nodeArray = [[NSMutableArray alloc] init];
    }
    return self;
}

//if not repeat command, then return emoty array

-(NSArray *)getChildren {
    return _nodeArray;
}
-(void)evaluate{
    NSLog(@"this is TreeNode");
}
- (void) addChildren:(TreeNode *)node{
    
}

@end

@implementation CSNode

- (void)evaluate{
    NSLog(@"Clear screen");
}

@end

@implementation PUNode

- (void)evaluate{
    NSLog(@"Pen up.");
}

@end

@implementation PDNode

- (void)evaluate{
    NSLog(@"Pen down.");
}

@end

@implementation NodeWithNumber
-(id)init{
    self=[super init];
    if (self)
        _number=0;
    return self;
}

//initialize the NodeWithNumber, set the number as argument of command
-(void)evaluate{
    NSLog(@"Move turtle");
}

@end

@implementation FDNode

-(void)evaluate{
    NSLog(@"Move turtle %d steps forward.", [self.number intValue]);
}

@end

@implementation BKNode

-(void)evaluate{
    NSLog(@"Move turtle %d steps backward.", [self.number intValue]);
}

@end

@implementation RTNode

-(void)evaluate{
    NSLog(@"Turn turtle %d degrees right.",[self.number intValue]);
}

@end

@implementation LTNode

-(void)evaluate{
    NSLog(@"Turn turtle %d degrees left.",[self.number intValue]);
}

@end

@implementation RepeatNode

-(NSArray *)getChildren:(TreeNode *)node{
    return self.nodeArray;
}

-(void)addChildren:(TreeNode *)node{
    [self.nodeArray addObject:node];
}

-(void)evaluate{
    int i,j;
    for (i=0; i<[self.number intValue]; i++) {
        for (j=0; j<[self.nodeArray count]; j++) {
            [self.nodeArray[j] evaluate];
        }
    }
}
@end


@implementation MakeNode

-(void)evaluate{
    [VariableTable setVars:_name forValue:[NSNumber numberWithInt:0]];
    
    NSLog(@"Define variable %@", _name);
}

@end

@implementation SetNode

-(void)evaluate{
    
    if (_isVar == YES){
        NSNumber* anoValue = [VariableTable getVars:_anoName];
        [VariableTable setVars:_name forValue:anoValue];
        NSLog(@"Define variable %@, value %@", _name, _anoName);
    }
    else{
        [VariableTable setVars:_name forValue:_value];
        NSLog(@"Define variable %@, value %@", _name, _value);
    }
    
}

@end









