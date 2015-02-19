//
//  ViewController.m
//  BrushSample
//
//  Created by kubo naoko on 2015/02/19.
//  Copyright (c) 2015年 kubo naoko. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [_paintingView setBackgroundColor:[UIColor colorWithWhite:1.0f alpha:0.0f]];
    [_paintingView initBrush:2];
    [_segCtl setSelectedSegmentIndex:0];
    [_segCtl addTarget:self action:@selector(segmentChanged:)
      forControlEvents:UIControlEventValueChanged];
    [_photoView setUserInteractionEnabled:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)segmentChanged:(UISegmentedControl*)seg{
    CGRect rect = _photoView.frame;
    NSLog(@"[%4.4f/%4.4f]",rect.origin.x,rect.origin.y);
    NSLog(@"[%4.4f/%4.4f]",rect.size.width,rect.size.height);
    switch (seg.selectedSegmentIndex) {
        case 0:
            [_paintingView changePen:2 :1.0f];
            [_paintingView setUserInteractionEnabled:YES];
            [_photoView setUserInteractionEnabled:NO];
            break;
        case 1:
            [_paintingView setUserInteractionEnabled:YES];
            [_photoView setUserInteractionEnabled:NO];
            [_paintingView eraser:2 :1];
            break;
        case 2:
            [_paintingView setUserInteractionEnabled:NO];
            [_photoView setUserInteractionEnabled:YES];
            NSLog(@"!![%4.4f/%4.4f]",rect.origin.x,rect.origin.y);
            NSLog(@"!![%4.4f/%4.4f]",rect.size.width,rect.size.height);
            break;
        case 3:
            [_paintingView erase];
            [_photoView setImage:[UIImage imageNamed:@"photo.png"]];
            break;
            
        default:
            break;
    }

}

@end
