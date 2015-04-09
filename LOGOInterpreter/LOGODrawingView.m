//
//  LOGODrawingView.m
//  LOGO Interpreter
//
//  Created by Chengpeng Qin on 16/3/15.
//  Copyright (c) 2015 Chengpeng Qin. All rights reserved.
//

#import "LOGODrawingView.h"

@implementation LOGODrawingView

- (void)awakeFromNib{  //set background color and border color, not allowed to modify this method
    self.wantsLayer = YES;
    self.layer.backgroundColor = [[NSColor whiteColor] CGColor];
    self.layer.borderWidth = 1.0f;
    self.layer.borderColor = [[NSColor grayColor] CGColor];
}

- (void)drawRect:(NSRect)dirtyRect {  //not allowed to modify this method
    [super drawRect:dirtyRect];
	[[NSColor blueColor] set];   // This sentence is used to set the path to be blue!
    [self.path stroke];
}

@end
