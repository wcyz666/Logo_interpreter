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

- (NSNumber*) getNumber{
    NSNumber* mynumber;
    if (_isVar == YES)
        mynumber = [VariableTable getVars:_name];
    else
        mynumber = _number;
    return mynumber;
}

//initialize the NodeWithNumber, set the number as argument of command
-(void)evaluate{
    NSLog(@"Move turtle");
}

@end

@implementation FDNode

-(void)evaluate{
    NSNumber* mynumber = [self getNumber];

    NSLog(@"Move turtle %d steps forward.", [mynumber intValue]);
}

@end

@implementation BKNode

-(void)evaluate{
    NSNumber* mynumber = [self getNumber];
    
    NSLog(@"Move turtle %d steps backward.", [mynumber intValue]);
}

@end

@implementation RTNode

-(void)evaluate{
    
    NSNumber* mynumber = [self getNumber];
    
    NSLog(@"Turn turtle %d degrees right.",[mynumber intValue]);
}

@end

@implementation LTNode

-(void)evaluate{
    
    NSNumber* mynumber = [self getNumber];
    
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
    
    NSNumber* mynumber = [self getNumber];
    
    for (i=0; i<[mynumber intValue]; i++) {
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
    
    if (_isVar == YES)
        [VariableTable setVars:_name forValue:[VariableTable getVars:_anoName]];
    else
        [VariableTable setVars:_name forValue:_number];
    
    NSLog(@"Set variable %@, value %@", _name, [VariableTable getVars:_name]);
}

@end

@implementation AddNode

-(void)evaluate{
    
    int value1, value2;
    if ([[_vars objectAtIndex:0] isKindOfClass:[NSNumber class]] == YES)
        value1 = [[_vars objectAtIndex:0] intValue];
    else
        value1 = [[VariableTable getVars:[_vars objectAtIndex:0]] intValue];
    
    if ([[_vars objectAtIndex:1] isKindOfClass:[NSNumber class]] == YES)
        value2 = [[_vars objectAtIndex:1] intValue];
    else
        value2 = [[VariableTable getVars:[_vars objectAtIndex:1]] intValue];
    
    [VariableTable setVars:_name forValue:[NSNumber numberWithInt:(value1 + value2)]];
    
    NSLog(@"Set variable %@, value %@", _name, [VariableTable getVars:_name]);
}

@end

@implementation SubNode

-(void)evaluate{
    
    int value1, value2;
    if ([[_vars objectAtIndex:0] isKindOfClass:[NSNumber class]] == YES)
        value1 = [[_vars objectAtIndex:0] intValue];
    else
        value1 = [[VariableTable getVars:[_vars objectAtIndex:0]] intValue];
    
    if ([[_vars objectAtIndex:1] isKindOfClass:[NSNumber class]] == YES)
        value2 = [[_vars objectAtIndex:1] intValue];
    else
        value2 = [[VariableTable getVars:[_vars objectAtIndex:1]] intValue];
    
    [VariableTable setVars:_name forValue:[NSNumber numberWithInt:(value1 - value2)]];
    
    NSLog(@"Set variable %@, value %@", _name, [VariableTable getVars:_name]);
}

@end




