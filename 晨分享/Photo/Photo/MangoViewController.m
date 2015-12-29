//
//  MangoViewController.m
//  Photo
//
//  Created by scjy on 15/12/28.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import "MangoViewController.h"
#import "SecondViewController.h"
@interface MangoViewController ()
@property(nonatomic, retain) UIImageView *imageview;
@property(nonatomic, retain) NSString *path;
@property(nonatomic, retain) NSData *data;
@end

@implementation MangoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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

-(void)photo{
    
    SecondViewController *mango=[[SecondViewController alloc]init];
    
    
    mango.delegate=self;
    [self presentViewController:mango animated:YES completion:nil];
    
    
}

-(void)string:(NSString *)path{
    NSLog(@"...");
    
    //    UIImage *readimage=[UIImage imageWithContentsOfFile:path];
    //
    //    NSLog(@"%@",readimage);
    //
    //    self.imageview.image=readimage;
    

}

-(void)data:(NSData *)data{
    NSLog(@"%@",data);
    
    
    self.path=[NSString stringWithFormat:@"%@,%@",[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject],@"ol" ];
    
     [data writeToFile:self.path atomically:YES];
    
    UIImage *readimage=[UIImage imageWithContentsOfFile:self.path];
    
    NSLog(@"%@",readimage);
    
    self.imageview.image=readimage;
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
