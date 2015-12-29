//
//  MangoViewController.m
//  UITextView
//
//  Created by scjy on 15/12/8.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//
#define kwidth   [UIScreen mainScreen].bounds.size.width
#import "MangoViewController.h"

@interface MangoViewController ()
@property(nonatomic,retain) UITextView *textView;

@end

@implementation MangoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
    
    self.textView = [[UITextView alloc]initWithFrame:CGRectMake(80, 100, kwidth - 100, 200)];
    self.textView.backgroundColor = [UIColor brownColor];
    self.textView.text = @"jhdfjvfv";
    self.textView.font = [UIFont systemFontOfSize:20];
    self.textView.textColor = [UIColor redColor];
    self.textView.textAlignment = NSTextAlignmentCenter;
    //是否可编辑
   // self.textView.editable = NO;
    self.textView.layer.cornerRadius = 6.0f;//圆角半径
    self.textView.layer.borderWidth = 5.0;//边框
    self.textView.layer.borderColor = [UIColor blueColor].CGColor;
    self.textView.allowsEditingTextAttributes = YES;//yes 可以设置文本字体倾斜  是否允许编辑文本的属性
    
    //文本过多不允许滚动
    self.textView.scrollEnabled = NO;
    //设置代理
    self.textView.delegate = self;
    
    [self.view addSubview:self.textView];
    [self.textView release];






}
//
-(BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    NSLog(@"%s",__FUNCTION__);
    return YES;
}
//已经编辑
-(void)textViewDidBeginEditing:(UITextView *)textView{
    NSLog(@"fbfgb");
}
-(BOOL)textViewShouldEndEditing:(UITextView *)textView{
    return YES;
}
-(void)textViewDidEndEditing:(UITextView *)textView{
      NSLog(@"%s",__FUNCTION__);
}
//键盘回收
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.textView resignFirstResponder];//点击空白处回收键盘
}

//
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    //换行回收键盘
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    NSLog(@"shouldChangeTextInRange");
    return YES;
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
