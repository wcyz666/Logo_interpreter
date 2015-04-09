//
//  TreeNode.h
//  phase2
//
//  Created by Jialiang Zhao on 18/3/15.
//  Copyright (c) 2015 Jialiang Zhao. All rights reserved.
//

#ifndef phase2_Tree_h
#define phase2_Tree_h


#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>
#import "Position.h"

@interface TreeNode : NSObject{
    
}

@property NSMutableArray *nodeArray;

-(NSArray *)getChildren;
-(void)evaluate:(NSBezierPath *)path forPosition:(Position *)pos;
-(void)addChildren:( TreeNode *)node;
+(void)draw:(NSBezierPath *)path forPosition:(Position *)pos;

@end


@interface NodeWithNumber : TreeNode{
}
@property (nonatomic) NSNumber* number;
@property (nonatomic) NSString* name;
@property (nonatomic) bool isVar;
@end


@interface CSNode : TreeNode{
    
}

@end

@interface PUNode : TreeNode{
    
}

@end

@interface PDNode : TreeNode{
    
}

@end

@interface MakeNode : TreeNode{
    
}

@property (copy, nonatomic) NSString* name;

@end

@interface SetNode : TreeNode{
    
}

@property (nonatomic) NSString* name;
@property (nonatomic) NSString* anoName;
@property (nonatomic) bool isVar;
@property (nonatomic) NSNumber* number;

@end

@interface AddNode : TreeNode{
    
}
@property (nonatomic) NSString* name;
@property (nonatomic) NSMutableArray* vars;
@end

@interface SubNode : TreeNode{
    
}
@property (nonatomic) NSString* name;
@property (nonatomic) NSMutableArray* vars;
@end

@interface WhileNode : TreeNode{
    
}
@property (nonatomic) int compare;
@property (nonatomic) NSMutableArray* vars;
@end

@interface FDNode : NodeWithNumber{
    
}

@end

@interface BKNode : NodeWithNumber{
    
}

@end

@interface RTNode : NodeWithNumber{
    
}

@end

@interface LTNode : NodeWithNumber{
    
}

@end

@interface RepeatNode : NodeWithNumber{
    
}

@end

#endif
