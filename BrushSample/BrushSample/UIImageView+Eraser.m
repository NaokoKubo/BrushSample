//
//  UIImageView+Eraser.m
//  BrushSample
//
//  Created by kubo naoko on 2015/02/19.
//  Copyright (c) 2015年 kubo naoko. All rights reserved.
//
#import <objc/runtime.h>

#import "UIImageView+Eraser.h"
@interface UIImageView(){
    BOOL    isEraser;
}
@end

@implementation UIImageView(Eraser)

- (void)setEraser:(id)eraser {
    objc_setAssociatedObject(self, "eraser", eraser, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)eraser {
    return objc_getAssociatedObject(self, "eraser");
}

#pragma mark touchEvents
//消しゴム
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    if(self.eraser) return;
    
    CGFloat	scale = self.transform.a;
    if (scale < 1) scale = 1;
    
    CGPoint p = [[touches anyObject] locationInView: self];
    CGPoint q = [[touches anyObject] previousLocationInView: self];
    
    UIImage*    image;
    image = self.image;
    CGSize  size = self.frame.size;
    UIGraphicsBeginImageContext(size);
    CGRect  rect;
    rect.origin = CGPointZero;
    rect.size = size;
    [image drawInRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextBeginPath(context);
    
    CGContextSaveGState( context );
    CGContextSetLineWidth(context, (20.0 / scale) + 1);
    CGContextSetBlendMode(context, kCGBlendModeClear);
    CGContextMoveToPoint(context, q.x, q.y);
    CGContextAddLineToPoint(context, p.x, p.y);
    CGContextStrokePath(context);
    CGContextRestoreGState( context );
    UIImage* editedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self setBounds:rect];
    [self setImage:editedImage];
    //    [self.view setNeedsDisplay];
    
}

@end
