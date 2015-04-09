//
//  ViewController.m
//  picList
//
//  Created by mac on 15/4/9.
//  Copyright (c) 2015年 xing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UILabel *label;
@property (nonatomic,strong) UIImageView *image;
@property (nonatomic,strong) UILabel *des;
@property (nonatomic,strong) UIButton *leftBtn;
@property (nonatomic,strong) UIButton *rightBtn;
@property (nonatomic, assign) int index;


@property (nonatomic,strong)NSArray *imageList;
@end

@implementation ViewController

-(NSArray *)imageList{
    if (_imageList ==nil){
   
        NSString *bundle = [[NSBundle mainBundle]pathForResource:@"ImageList" ofType:@"plist"];
        _imageList = [NSArray arrayWithContentsOfFile:bundle];
    }
    return _imageList;
}
- (UILabel *)label{
    if (_label ==nil) {
        CGFloat screenWitdth = self.view.bounds.size.width;
        _label = [[UILabel alloc]initWithFrame:CGRectMake(0, 20 , screenWitdth, 40)];
        _label.backgroundColor = [UIColor redColor];
        _label.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:_label];
    }
    return  _label;
}

-(UIImageView *)image{
    if (_image ==nil) {
        CGFloat imgWidth = 200;
        CGFloat imgHeight = 200;
        CGFloat imgX = ( self.view.bounds.size.width -imgWidth ) * 0.5;
        CGFloat imgY = CGRectGetMaxY(self.label.frame)+20;
        _image = [[UIImageView alloc]initWithFrame:CGRectMake(imgX, imgY, imgWidth, imgHeight)];
        _image.image = [UIImage imageNamed:@"danteng"];
        [self.view addSubview:_image];
    }
    return _image;
}


- (UILabel *)des{
    
    if (_des==nil){
        CGFloat descY = CGRectGetMaxY(self.image.frame)+20;
        _des = [[UILabel alloc] initWithFrame: CGRectMake(0, descY, self.view.bounds.size.width, 100)];
        _des.text = @"详情";
        _des.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:_des];
    }
    return _des;
}

- (UIButton *)leftBtn {
    if (_leftBtn ==nil) {
    _leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    CGFloat btnX = self.image.frame.origin.x * 0.5;
    CGFloat btnY = self.image.center.y;
    _leftBtn.center = CGPointMake(btnX, btnY);
    [_leftBtn setTitle:@"左" forState:UIControlStateNormal];
    [_leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _leftBtn.tag = -1;
    [self.view addSubview:_leftBtn];
    [_leftBtn addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftBtn;
}

-(UIButton *)rightBtn{
    if (_rightBtn==nil) {
        _rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        
        CGFloat btnX = self.image.frame.origin.x * 0.5;
        CGFloat btnY = self.image.center.y;
        _rightBtn.center = CGPointMake(self.view.bounds.size.width - btnX, btnY);
        [_rightBtn setTitle:@"右" forState:UIControlStateNormal];
        [_rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.view addSubview:_rightBtn];
        _rightBtn.tag = 1;
        [_rightBtn addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];

    }
       return _rightBtn;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
  
    
    [self showPic];
}


- (void)showPic
{
    self.label.text = [NSString stringWithFormat:@"%d/%d",self.index + 1,5];
    self.image.image = [UIImage imageNamed:self.imageList[self.index][@"name"]];
    self.des.text = self.imageList[self.index][@"desc"];
    self.rightBtn.enabled = (self.index != 4);
    self.leftBtn.enabled = (self.index !=0);
}



-(void)clickButton:(UIButton *)button
{
    self.index += button.tag;
    [self showPic];
}



@end
