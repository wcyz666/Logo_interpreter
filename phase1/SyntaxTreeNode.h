//
//  TreeNode.h
//  phase2
//
//  Created by Jialiang Zhao on 18/3/15.
//  Copyright (c) 2015 Jialiang Zhao. All rights reserved.
//

#ifndef phase2_Tree_h
#define phase2_Tree_h

#endif
#import <Foundation/Foundation.h>

@interface TreeNode : NSObject{
    
}

@property NSMutableArray *nodeArray;

-(NSArray *)getChildren;
-(void)evaluate;
-(void)addChildren:( TreeNode *)node;

@end


@interface NodeWithNumber : TreeNode{
}
@property (nonatomic) NSNumber* number;
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
