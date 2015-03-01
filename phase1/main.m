//
//  main.m
//  phase1
//
//  Created by wcyz666 on 15-2-21.
//  Copyright (c) 2015 wcyz666. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StringSplitter.h"

int main(int argc, const char * argv[]) {
    StringSplitter* splitter = [[StringSplitter alloc] init];
    splitter.string = @"Multiplication1 11, 13, 17 and 09";
    NSLog(@"Words:\n");

    for( NSString *word in [splitter words]){
        NSLog(@"> %@\n", word);
    }
    NSLog(@"\nNumbers:\n\n");
    for(NSNumber *number in [splitter numbers]){
        NSLog(@"> %@\n", number);
    }
    NSLog(@"\nWords and Numbers:\n\n");
    for(id token in [splitter wordsAndNumbers]){
        NSLog(@"> %@\n", token); }
    return 0;
}
