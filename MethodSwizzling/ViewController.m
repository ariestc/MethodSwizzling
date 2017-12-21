//
//  ViewController.m
//  MethodSwizzling
//
//  Created by wangliang on 2017/12/21.
//  Copyright © 2017年 wangliang. All rights reserved.
//

#import "ViewController.h"
#import "MyViewController.h"

@interface ViewController ()

@property(nonatomic,weak) UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.view.backgroundColor=[UIColor redColor];
 
    [self test02];
    
   
}

-(void)test02
{
    UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 300, 100)];
    
    //1.图片在Assets.xcassets
//    imageView.image=[UIImage imageNamed:@"1109.jpg"]
//        imageView.image=[UIImage imageNamed:@"09.jpg"];
    imageView.image=[UIImage imageNamed:@"timg.jpeg"];
    
    //2. Phases->Copy Bundle resources 手动添加timg.jpeg即可显示
    //  NSString *imagePath=[[NSBundle mainBundle] pathForResource:@"timg" ofType:@"jpeg"];
    
    //3.Phases->Copy Bundle resources 手动添加蓝色image即可显示
//    NSString *imagePath=[[NSBundle mainBundle] pathForResource:@"nfyp" ofType:@"jpg" inDirectory:@"image"];
//    imageView.image=[UIImage imageWithContentsOfFile:imagePath];
    
    [self.view addSubview:imageView];
    
    self.imageView=imageView;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
   
    MyViewController *myVc=[[MyViewController alloc] init];
    
    [self.navigationController pushViewController:myVc animated:YES];
}

-(void)test01
{
    //    NSArray *a=@[@"Aries",@"tom"];
    //    NSLog(@"a=%@",[a objectAtIndex:2]);
    //    NSLog(@"a=%@",a[2]);
    
    //    NSArray *a=@[@"Aries",@"sam",@"juli"];
    NSArray *a=@[@"sssd",@"hah"];
    NSLog(@"a=%@",a[2]);
}


@end
