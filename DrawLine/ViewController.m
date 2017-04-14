//
//  ViewController.m
//  DrawLine
//
//  Created by 冷求慧 on 17/3/17.
//  Copyright © 2017年 冷求慧. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<CAAnimationDelegate>

@property (nonatomic,strong)UIBezierPath   *mainPath;

@property (nonatomic,strong)CAShapeLayer   *mainShaprLayer;

@property (weak, nonatomic) IBOutlet UIView *mainDrawView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addPathToShape];
    
    [self loadLineWithAnimation];
}
#pragma mark 添加对应的路径
-(void)addPathToShape{
    
    self.mainPath=[UIBezierPath bezierPath];
    
    [self.mainPath moveToPoint:CGPointMake(30, 20)];      // 起点
    [self.mainPath addLineToPoint:CGPointMake(self.mainDrawView.frame.size.width-30, 20)]; //  终点
    
    self.mainShaprLayer=[CAShapeLayer layer];
    [self.mainDrawView.layer addSublayer:self.mainShaprLayer];  // 给视图添加图层(一定要)
    
    self.mainShaprLayer.path=self.mainPath.CGPath;
    self.mainShaprLayer.lineWidth=2.0;  // 线条的宽度
    self.mainShaprLayer.fillColor=[UIColor clearColor].CGColor;//填充颜色
    self.mainShaprLayer.strokeColor=[UIColor redColor].CGColor;//边框颜色
    
}
#pragma mark 动画执行路径
-(void)loadLineWithAnimation{
    
    
    // 基础动画(划线)
    CABasicAnimation *pathAniamtion=[CABasicAnimation animationWithKeyPath:@"strokeEnd"]; //动画
    pathAniamtion.duration=2.0f; // 时间
    pathAniamtion.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    pathAniamtion.fromValue=[NSNumber numberWithFloat:0.0f];
    pathAniamtion.toValue=[NSNumber numberWithFloat:1.0];
    
    pathAniamtion.delegate=self;
    [self.mainShaprLayer addAnimation:pathAniamtion forKey:nil];  // 在图层上面添加动画
    
}
#pragma mark 动画结束
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
}
@end
