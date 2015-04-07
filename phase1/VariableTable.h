//
//  VariabeTable.h
//  phase1
//
//  Created by wcyz666 on 15-4-6.
//  Copyright (c) 2015年 wcyz666. All rights reserved.
//

#ifndef phase1_VariabeTable_h
#define phase1_VariabeTable_h


#endif
#import <Foundation/Foundation.h>

@interface VariableTable : NSObject{
}
+ (NSNumber*) getVars: (NSString* ) variable;

+ (void) setVars: (NSString*) name forValue :(NSNumber*) value;

+ (NSDictionary*) table;

@end