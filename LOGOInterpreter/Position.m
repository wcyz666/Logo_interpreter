//
//  Position.m
//  phase1
//
//  Created by Jialiang Zhao on 11/4/15.
//  Copyright (c) 2015 wcyz666. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Position.h"

@implementation Position

-(id)init{
    self = [super init];
    if (self){
        _x=300.0f;
        _y=200.0f;
        _direction=90;
        _penDown=YES;
    }
    return self;
}

@end