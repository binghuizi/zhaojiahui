//
//  MangoViewController.m
//  PhotoLianXi
//
//  Created by scjy on 15/12/22.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import "MangoViewController.h"

@interface MangoViewController ()
@property(nonatomic,retain) UIImagePickerController *picker;
@property(nonatomic,retain) UIImageView *imageView;
@property(nonatomic,retain) UIButton *button;
@end

@implementation MangoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"系统相机";
    
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(30, 80, 330, 380)];
    self.imageView.backgroundColor = [UIColor lightGrayColor];
    //打开用户
    self.imageView.userInteractionEnabled = YES;
    [self.view addSubview:self.imageView];
    
    //手势
    [self addTapGesture];
    
 //点击按钮
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.frame = CGRectMake(130, 500, 100, 40);
    self.button.backgroundColor = [UIColor orangeColor];
    self.button.layer.cornerRadius = 10.0;
    [self.button setTitle:@"请点击" forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(pickerImage:) forControlEvents:UIControlEventTouchUpInside];
    //添加到视图上
    [self.view addSubview:self.button];
    
    
    
}
//手势
- (void)addTapGesture{
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(touchAction:)];
    [self.imageView addGestureRecognizer:tap];
    
    
    
    
    
    
}

- (void)touchAction:(UIButton *)btn{
    UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"拍照" otherButtonTitles:@"选择", nil];
    [sheet showInView:self.view];
}
//必须实现的
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
            //系统相机
            [self pickerPictureCamera];
            break;
            case 1:
            //从图库
            [self pickerPictureAlumb];
            
        default:
            break;
    }
}
 //系统相机
- (void)pickerPictureCamera{
    //判断摄像头是否可用
    if ([UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront]) {
        self.picker = [[UIImagePickerController alloc]init];
        self.picker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
        
    }else if ([UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear]){
        self.picker = [[UIImagePickerController alloc]init];
        self.picker.cameraDevice = UIImagePickerControllerCameraDeviceRear;
    }else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"失败" message:@"图库选择" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    //初始化图片控制对象
    UIImagePickerController *imageViewPicker = [[UIImagePickerController alloc]init];
    imageViewPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imageViewPicker.allowsEditing = YES;
    imageViewPicker.delegate = self;
    [self presentViewController:imageViewPicker animated:YES completion:nil];
    
}
//从图库获取
- (void)pickerPictureAlumb{
    UIImagePickerController *imageViewPicker = [[UIImagePickerController alloc]init];
    imageViewPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imageViewPicker.allowsEditing = YES;
    imageViewPicker.delegate = self;
    [self presentViewController:imageViewPicker animated:YES completion:nil];
}
//显示视图上
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    self.imageView.image = [info objectForKey:UIImagePickerControllerEditedImage];
    [self dismissViewControllerAnimated:YES completion:nil];
}
//按钮
-(void)pickerImage:(UIButton *)btn{
    UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"拍照" otherButtonTitles:@"选择", nil];
    [sheet showInView:self.view];
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
