//
//  MangopViewController.m
//  PickView
//
//  Created by scjy on 15/12/21.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import "MangopViewController.h"

@interface MangopViewController ()
@property(nonatomic,retain) UIPickerView *pickView;
@property(nonatomic,retain) NSArray *pickArray;
@property(nonatomic,retain) NSArray *groupArray;
@property(nonatomic,retain)NSDictionary *dic;

@end

@implementation MangopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.pickView = [[UIPickerView alloc]initWithFrame:CGRectMake(30, 100, 300, 150)];
    self.pickView.backgroundColor = [UIColor lightGrayColor];
    self.pickView.dataSource = self;
    self.pickView.delegate = self;
    
    [self.view addSubview:self.pickView];
    [self.pickView release];
    [self path];
}
//解析
- (void)path{
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:@"AddressBook" ofType:@".plist"];
    //把解析出的数据存储到字典中
    self.dic = [[NSDictionary alloc] initWithContentsOfFile:path];
    //取出字典中所有键值存放在组名（数组中）
    self.pickArray = [self.dic allKeys];
    //UIPickerView框中列的下标
    NSInteger selectedPickerIndex = [self.pickView selectedRowInComponent:0];
    //
    NSString *selectedPicker = [self.pickArray objectAtIndex:selectedPickerIndex];
    //取出组对应的成员
    self.groupArray = [self.dic objectForKey:selectedPicker];
    NSLog(@"%lu",(unsigned long)[self.pickArray count]);
}
//显示的列数
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

//显示的行数
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
        return self.pickArray.count;
    }else{
        return self.groupArray.count;
    }
    
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == 0) {
        return [self.pickArray objectAtIndex:row];
    }else{
        return [self.groupArray objectAtIndex:row];
    }
}

//高度

//宽度
//监听滚轮的移动
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component == 0) {
        NSString *string = [self.pickArray objectAtIndex:row];
        NSArray *array = [self.dic objectForKey:string];
        self.groupArray = array;
        
        [self.pickView selectRow:0 inComponent:1 animated:YES];
        //重新加载整个视图
        [self.pickView reloadComponent:1];
        
    }else{
        //UIPickerView对应不同的列轮，显示不同的行
        NSInteger picker = [self.pickView selectedRowInComponent:0];
        NSInteger group = [self.pickView selectedRowInComponent:1];
        
        NSString *selected = [self.pickArray objectAtIndex:picker];
        NSString *select = [self.groupArray objectAtIndex:group];
        NSString *message = [[NSString alloc] initWithFormat:@"你选择的是：%@ %@",selected,select];
        NSLog(@"%@",message);
        
    }
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
