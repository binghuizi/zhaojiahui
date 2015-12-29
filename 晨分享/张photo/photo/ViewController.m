//
//  ViewController.m
//  photo
//
//  Created by scjy on 15/12/25.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import "ViewController.h"
#import "MangoViewController.h"
@interface ViewController ()
@property(nonatomic, retain) UIImageView *imageview;
@property(nonatomic, retain) NSString *path;
@property(nonatomic, retain) NSData *data;
@end

@implementation ViewController






- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.imageview=[[UIImageView alloc]initWithFrame:CGRectMake(60, 100, self.view.frame.size.width-120, self.view.frame.size.width-120)];
    
    self.imageview.userInteractionEnabled=YES;
    self.imageview.backgroundColor=[UIColor redColor];
    
    self.imageview.layer.cornerRadius=(self.view.frame.size.width-120)/2;
    
    self.imageview.clipsToBounds=YES;
    
    [self.view addSubview:self.imageview];
    
    
    
    
    
    
    
    
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(30, self.view.frame.size.width-120+100, self.view.frame.size.width-60, 44)];
    
    [btn setTitle:@"相册" forState:UIControlStateNormal];
    btn.backgroundColor=[UIColor blueColor];
    
    [btn addTarget:self action:@selector(photo) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
    
    
    
    
    
    
}




- (void)string:(NSString *)path{
    
    NSLog(@"...");
    
//    UIImage *readimage=[UIImage imageWithContentsOfFile:path];
//    
//    NSLog(@"%@",readimage);
//    
//    self.imageview.image=readimage;
    
    
    
}


- (void)data:(NSData *)data{
    
   
    NSLog(@"%@",data);
    
    
    self.path=[NSString stringWithFormat:@"%@,%@",[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject],@"ol" ];
   
    
    [data writeToFile:self.path atomically:YES];
    
    
    UIImage *readimage=[UIImage imageWithContentsOfFile:self.path];
    
    NSLog(@"%@",readimage);
    
    self.imageview.image=readimage;

    
    
    
    
}


-(void)photo{
    
    MangoViewController *mango=[[MangoViewController alloc]init];
    
    
    mango.delegate=self;
    [self presentViewController:mango animated:YES completion:nil];
    
    
}









- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
