//
//  AppDelegate.m
//  LOGO Interpreter
//
//  Created by Chengpeng Qin on 16/3/15.
//  Copyright (c) 2015 Chengpeng Qin. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@property (nonatomic, strong) LOGOModel *logoModel;
@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet LOGODrawingView *logoDrawingView;
@property (unsafe_unretained) IBOutlet NSTextView *programTextView;
@end

@implementation AppDelegate

- (LOGOModel *)logoModel{
    if (_logoModel == nil) {
        _logoModel = [[LOGOModel alloc] init];
        
    }
    return _logoModel;
    //lazy instantiation of logoModel
}

- (IBAction)executeButtonClicked:(NSButton *)sender {  //not allowed to modify this method
    [self.logoModel setSourceCodeWithString: self.programTextView.textStorage.string];
    NSBezierPath *path = [self.logoModel executeLOGO];
    [path setLineWidth: 1];
    self.logoDrawingView.path = path;
    [self.logoDrawingView setNeedsDisplay:YES];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    //Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    //Insert code here to tear down your application
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender{
    return YES;
}

@end
