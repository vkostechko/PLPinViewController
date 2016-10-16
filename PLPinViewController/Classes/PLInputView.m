//
//  PLInputView.m
//  Pods
//
//  Created by Ash Thwaites on 15/10/2016.
//
//

#import "PLInputView.h"

@implementation PLInputView

-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    for (UIView *view in self.subviews) {
        if (!view.hidden && view.alpha > 0 && view.userInteractionEnabled && [view pointInside:[self convertPoint:point toView:view] withEvent:event])
            return YES;
    }
    return NO;
}

@end
