//
//  MangoViewController.m
//  UIDataPicker
//
//  Created by scjy on 15/12/23.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import "MangoViewController.h"

@interface MangoViewController ()
@property(nonatomic,retain) UILabel *label;
@property(nonatomic,retain) UIDatePicker *dataPicer;

@end

@implementation MangoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

  self.title = @"UIDataPicker";
    self.dataPicer = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, 80, self.view.frame.size.width, 216)];
    
    self.dataPicer.backgroundColor = [UIColor lightGrayColor];
    
    
    [self.view addSubview:self.dataPicer];
    [self.dataPicer addTarget:self action:@selector(dataAction) forControlEvents:UIControlEventValueChanged];
    //格式显示中文
    NSLocale *local = [[NSLocale alloc]initWithLocaleIdentifier:@"zh_sc"];
    self.dataPicer.locale = local;
    //格式显示yingwen
//    NSLocale *local = [[NSLocale alloc]initWithLocaleIdentifier:@"en_cn"];
//    self.dataPicer.locale = local;
   
    
//设置当前日期
    [self.dataPicer setCalendar:[NSCalendar currentCalendar]];

//设置时区
    [self.dataPicer setTimeZone:[NSTimeZone systemTimeZone]];
    //设置时间的上下限制
    NSDateFormatter *from = [[NSDateFormatter alloc]init];
    [from setDateFormat:@"yyy_MM_dd"];
    //最小事件限制
    NSDate *main = [from dateFromString:@"2004.01.01"];
    NSDate *max = [from dateFromString:@"2020.01.01"];
    [self.dataPicer setMinimumDate:main];
    [self.dataPicer setMaximumDate:max];
    [main release];
    [max release];
//模式 1.小时分钟 AM/pm
    [self.dataPicer setDatePickerMode:UIDatePickerModeTime];
    //2.显示年月日
    [self.dataPicer setDatePickerMode:UIDatePickerModeDate];
    //3.显示小时分钟
    [self.dataPicer setDatePickerMode:UIDatePickerModeCountDownTimer];
    //4.显示年月日小时分钟
    [self.dataPicer setDatePickerMode:UIDatePickerModeDateAndTime];
    //设置分钟间隔
    self.dataPicer.minuteInterval = 5;
    
    _label = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.dataPicer.frame)+20, CGRectGetWidth(self.dataPicer.frame) + 20, 30)];
    _label.backgroundColor = [UIColor lightGrayColor];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.text = @"日期和时间";
    [self.view addSubview:_label];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, CGRectGetMaxY(self.label.frame)+20, self.view.frame.size.width-200, 30);
    btn.backgroundColor=[UIColor groupTableViewBackgroundColor];
    //设置它的圆角大小
    btn.layer.cornerRadius = 10;
    //按钮的边框宽度
    btn.layer.borderWidth = 1;
    //设置为yes，就可以使用圆角
    btn.layer.masksToBounds = NO;
    //视图的边框颜色
    btn.layer.borderColor = [[UIColor greenColor] CGColor];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitle:@"点击返回今天" forState: UIControlStateNormal];
    [btn addTarget:self action:@selector(chlick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
- (void)dataAction{
    //当前默认时间
    NSDate *picherDate = [self.dataPicer date];
    NSDateFormatter *pickerFor = [[NSDateFormatter alloc]init];
    [pickerFor setDateFormat:@"yyy年MM月dd日(EEEE) HH:mm:ss"];
    NSString *dataString = [pickerFor stringFromDate:picherDate];
    _label.text = dataString;
}
- (void)chlick:(UIButton *)btn{
    NSDate *date = [NSDate date];
    [_dataPicer setDate:date animated:YES];
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
