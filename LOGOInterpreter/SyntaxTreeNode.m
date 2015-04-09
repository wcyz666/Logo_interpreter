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
-(void)evaluate:(NSBezierPath *)path forPosition:(Position *)pos{
    //NSLog(@"this is TreeNode");
}
- (void) addChildren:(TreeNode *)node{
    
}

+(void)draw:(NSBezierPath *)path forPosition:(Position *)pos {
    if (pos.penDown) {
        [path lineToPoint:CGPointMake(pos.x, pos.y)];
    } else {
        [path moveToPoint:CGPointMake(pos.x, pos.y)];
    }
}

@end

@implementation CSNode

-(void)evaluate:(NSBezierPath *)path forPosition:(Position *)pos{
    [path removeAllPoints];
    [path moveToPoint:CGPointMake(pos.x, pos.y)];
    ////NSLog(@"Clear screen");
}

@end

@implementation PUNode

-(void)evaluate:(NSBezierPath *)path forPosition:(Position *)pos{
    pos.penDown=NO;
    //NSLog(@"Pen up.");
}

@end

@implementation PDNode

-(void)evaluate:(NSBezierPath *)path forPosition:(Position *)pos{
    pos.penDown=YES;
    //NSLog(@"Pen down.");
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
-(void)evaluate:(NSBezierPath *)path forPosition:(Position *)pos{
    //NSLog(@"Move turtle");
}

@end

@implementation FDNode

-(void)evaluate:(NSBezierPath *)path forPosition:(Position *)pos{
    NSInteger step = [[self getNumber] integerValue];
    pos.x += step * cosf(pos.direction * M_PI / 180);
    pos.y += step * sinf(pos.direction * M_PI / 180);
    [TreeNode draw:path forPosition:pos];

    //NSLog(@"Move turtle %ld steps forward.", step);
    //NSLog(@"%@ path",path);
}

@end

@implementation BKNode

-(void)evaluate:(NSBezierPath *)path forPosition:(Position *)pos{
    NSInteger step = [[self getNumber] integerValue];
    pos.x -= step * cosf(pos.direction * M_PI / 180);
    pos.y -= step * sinf(pos.direction * M_PI / 180);
    [TreeNode draw:path forPosition:pos];
    
    //NSLog(@"Move turtle %ld steps backward.", step);
}

@end

@implementation RTNode

-(void)evaluate:(NSBezierPath *)path forPosition:(Position *)pos{
    
    NSInteger angle = [[self getNumber] integerValue];
    pos.direction -= angle;
    
    //NSLog(@"Turn turtle %ld degrees right.", angle);
}

@end

@implementation LTNode

-(void)evaluate:(NSBezierPath *)path forPosition:(Position *)pos{
    
    NSInteger angle = [[self getNumber] integerValue];
    pos.direction -= angle;
    
    //NSLog(@"Turn turtle %ld degrees left.", angle);
}

@end

@implementation RepeatNode

-(NSArray *)getChildren:(TreeNode *)node{
    return self.nodeArray;
}

-(void)addChildren:(TreeNode *)node{
    [self.nodeArray addObject:node];
}

-(void)evaluate:(NSBezierPath *)path forPosition:(Position *)pos{
    int i,j;
    
    NSNumber* mynumber = [self getNumber];
    
    for (i=0; i<[mynumber intValue]; i++) {
        for (j=0; j<[self.nodeArray count]; j++) {
            [self.nodeArray[j] evaluate:path forPosition:pos];
        }
    }
}
@end

@interface WhileNode()

- (BOOL) checkCondition;

@end

@implementation WhileNode

-(NSArray *)getChildren:(TreeNode *)node{
    return self.nodeArray;
}

-(void)addChildren:(TreeNode *)node{
    [self.nodeArray addObject:node];
}

-(void)evaluate:(NSBezierPath *)path forPosition:(Position *)pos{
    int j;
    
    while ([self checkCondition]) {
        for (j=0; j<[self.nodeArray count]; j++) {
            [self.nodeArray[j] evaluate:path forPosition:pos];
        }
    }
}
- (BOOL) checkCondition{
    int value1, value2;
    
    switch (_compare) {
        case 0:
            if ([[_vars objectAtIndex:0] isKindOfClass:[NSNumber class]] == YES)
                value1 = [[_vars objectAtIndex:0] intValue];
            else
                value1 = [[VariableTable getVars:[_vars objectAtIndex:0]] intValue];
            
            if ([[_vars objectAtIndex:1] isKindOfClass:[NSNumber class]] == YES)
                value2 = [[_vars objectAtIndex:1] intValue];
            else
                value2 = [[VariableTable getVars:[_vars objectAtIndex:1]] intValue];
            if (value1 == value2)
                return YES;
            else
                return NO;
            break;
        case 1:
            if ([[_vars objectAtIndex:0] isKindOfClass:[NSNumber class]] == YES)
                value1 = [[_vars objectAtIndex:0] intValue];
            else
                value1 = [[VariableTable getVars:[_vars objectAtIndex:0]] intValue];
            
            if ([[_vars objectAtIndex:1] isKindOfClass:[NSNumber class]] == YES)
                value2 = [[_vars objectAtIndex:1] intValue];
            else
                value2 = [[VariableTable getVars:[_vars objectAtIndex:1]] intValue];
            if (value1 > value2)
                return YES;
            else
                return NO;
            break;
        case 2:
            if ([[_vars objectAtIndex:0] isKindOfClass:[NSNumber class]] == YES)
                value1 = [[_vars objectAtIndex:0] intValue];
            else
                value1 = [[VariableTable getVars:[_vars objectAtIndex:0]] intValue];
            
            if ([[_vars objectAtIndex:1] isKindOfClass:[NSNumber class]] == YES)
                value2 = [[_vars objectAtIndex:1] intValue];
            else
                value2 = [[VariableTable getVars:[_vars objectAtIndex:1]] intValue];
            if (value1 < value2)
                return YES;
            else
                return NO;
            break;
        default:
            break;
    }
    return NO;
}

@end

@implementation MakeNode

-(void)evaluate:(NSBezierPath *)path forPosition:(Position *)pos{
    [VariableTable setVars:_name forValue:[NSNumber numberWithInt:0]];
    
    //NSLog(@"Define variable %@", _name);
}
@end

@implementation SetNode

-(void)evaluate:(NSBezierPath *)path forPosition:(Position *)pos{
    
    if (_isVar == YES)
        [VariableTable setVars:_name forValue:[VariableTable getVars:_anoName]];
    else
        [VariableTable setVars:_name forValue:_number];

    //NSLog(@"Set variable %@, value %@", _name, [VariableTable getVars:_name]);
}

@end

@implementation AddNode

-(void)evaluate:(NSBezierPath *)path forPosition:(Position *)pos{
    
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
    
    //NSLog(@"Set variable %@, value %@", _name, [VariableTable getVars:_name]);
}

@end

@implementation SubNode

-(void)evaluate:(NSBezierPath *)path forPosition:(Position *)pos{
    
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
    
    //NSLog(@"Set variable %@, value %@", _name, [VariableTable getVars:_name]);
}

@end




