//
//  PLPinButton.m
//  Pods
//
//  Created by Ash Thwaites on 15/10/2016.
//
//

#import "PLPinButton.h"

@implementation PLPinButton

- (void) setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    self.backgroundColor = (highlighted) ?  self.borderColor: [UIColor clearColor];
}

@end
