//
//  ViewController.h
//  BrushSample
//
//  Created by kubo naoko on 2015/02/19.
//  Copyright (c) 2015年 kubo naoko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PaintingView.h"
#import "UIImageView+Eraser.h"

@interface ViewController : UIViewController

@property(nonatomic)IBOutlet PaintingView* paintingView;
@property(nonatomic)IBOutlet UIImageView* photoView;
@property(nonatomic)IBOutlet UISegmentedControl* segCtl;

@end

