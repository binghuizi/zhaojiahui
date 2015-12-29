//
//  SecondViewController.m
//  Photo
//
//  Created by scjy on 15/12/28.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
//@property(nonatomic, retain) UIImageView *imageview;
@property(nonatomic, retain) NSString *path;
@property(nonatomic, retain) NSData *data;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.view.backgroundColor=[UIColor yellowColor];
    
    
    self.imageview=[[UIImageView alloc]initWithFrame:CGRectMake(60, 100, self.view.frame.size.width-120, self.view.frame.size.width-120)];
    
    self.imageview.userInteractionEnabled=YES;
    self.imageview.backgroundColor=[UIColor redColor];
    
    
    
    self.imageview.layer.cornerRadius=(self.view.frame.size.width-120)/2;
    self.imageview.clipsToBounds=YES;
    
    
    
    
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(open)];
    
    
    [self.imageview addGestureRecognizer:tap];
    
    
    [self.view addSubview:self.imageview];
    
    
    
    
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(30, self.view.frame.size.width-120+100, self.view.frame.size.width-60, 44)];
    
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    btn.backgroundColor=[UIColor blueColor];
    
    [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
    
    
    
}
//点击返回按钮触发事件
-(void)back{
    
    
    
    
    [self.delegate string:self.path];
    [self.delegate data:self.data];
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    
}

//点击圆选取系统相册
-(void)open{
    
    UIImagePickerController *pickerImage=[[UIImagePickerController alloc]init];
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        
        pickerImage.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        pickerImage.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:pickerImage.sourceType];
        
        pickerImage.delegate=self;
        pickerImage.editing=YES;
        
        [self presentViewController:pickerImage animated:YES completion:nil];
        
        
    }
    
}
//图片原路径 获取
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    NSLog(@"%@",info);//图片的路径
    UIImage *img=info[UIImagePickerControllerOriginalImage];
    self.imageview.image=img;//将图片显示在试图上
    self.data=UIImageJPEGRepresentation(img, 0.5);
    self.path=[NSString stringWithFormat:@"%@/%@.png",NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject,@"head"];//图片路径赋值
    
    [self.data writeToFile:self.path atomically:YES];
    
    NSLog(@"%@",self.path);
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
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
