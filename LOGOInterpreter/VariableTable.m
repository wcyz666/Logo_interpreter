//
//  VariableTable.m
//  phase1
//
//  Created by wcyz666 on 15-4-6.
//  Copyright (c) 2015年 wcyz666. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VariableTable.h"

@implementation VariableTable

static NSMutableDictionary *variables = nil;

+ (NSNumber*) getVars: (NSString* ) variable{
    return [variables objectForKey:variable];
}

+ (void) setVars: (NSString*) name forValue: (NSNumber *) value{
    if (variables == nil)
        variables = [NSMutableDictionary dictionaryWithCapacity:10];
    [variables setObject:value forKey: name];
}

+ (NSDictionary*) table{
    return variables;
}

@end