//
//  PickerViewController.m
//  UIPickerView
//
//  Created by scjy on 15/12/18.
//  Copyright (c) 2015年 芒果科技. All rights reserved.
//

#import "PickerViewController.h"

@interface PickerViewController ()
@property(nonatomic,retain) UIPickerView *pickerView;
@property(nonatomic,retain) NSArray *groupArray;//成员的数组
@property(nonatomic,retain) NSArray *pickerArray;//组名的数组
@property(nonatomic,retain) NSDictionary *dic;//用于存放组名-成员

@end

@implementation PickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor magentaColor];
    self.title = @"PickerView";
    
    self.pickerView  = [[UIPickerView alloc] initWithFrame:CGRectMake(30, 100, self.view.frame.size.width - 60, 150)];
    self.pickerView.backgroundColor = [UIColor cyanColor];
    //设置代理
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    //显示选中框
    self.pickerView.showsSelectionIndicator = YES;
    [self.view addSubview:self.pickerView];
    
    [self resolvePath];
    
    
    
    UIButton *selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    selectBtn.frame = CGRectMake(80, 300, self.view.frame.size.width - 160, 44);
    selectBtn.backgroundColor = [UIColor redColor];
    [selectBtn setTitle:@"SELECT" forState:UIControlStateNormal];
    [selectBtn addTarget:self action:@selector(press) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:selectBtn];
    
    
}
//解析组以及成员数据
- (void)resolvePath{
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:@"AddressBook" ofType:@".plist"];
    //把解析出的数据存储到字典中
    self.dic = [[NSDictionary alloc] initWithContentsOfFile:path];
    //取出字典中所有键值存放在组名（数组中）
    self.pickerArray = [self.dic allKeys];
    //UIPickerView框中列的下标
    NSInteger selectedPickerIndex = [self.pickerView selectedRowInComponent:0];
    //
    NSString *selectedPicker = [self.pickerArray objectAtIndex:selectedPickerIndex];
    //取出组对应的成员
    self.groupArray = [self.dic objectForKey:selectedPicker];
    NSLog(@"%lu",(unsigned long)[self.pickerArray count]);
}


#pragma mark-----------------UIPickerViewDataSource,UIPickerViewDelegate

//返回显示的列数
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}
//返回当前列显示的行数
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
        return self.pickerArray.count;//组名个数
    }else{
        return self.groupArray.count;//成员个数
    }
    
}
//返回当前行的内容,此处是将数组中数值添加到滚动的那个显示栏上 
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == 0) {
        return [self.pickerArray objectAtIndex:row];//组名
    }else{
        return [self.groupArray objectAtIndex:row];//成员名
    }
    
}

//显示框的高度
-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 50.0;
}
//显示框的宽度
-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    return 150;
}
//监听滚轮的移动
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component == 0) {
        NSString *string = [self.pickerArray objectAtIndex:row];
        NSArray *array = [self.dic objectForKey:string];
        self.groupArray = array;
        
        [self.pickerView selectRow:0 inComponent:1 animated:YES];
        //重新加载整个视图
        [self.pickerView reloadComponent:1];
    
    }else{
        //UIPickerView对应不同的列轮，显示不同的行
        NSInteger picker = [self.pickerView selectedRowInComponent:0];
        NSInteger group = [self.pickerView selectedRowInComponent:1];
        
        NSString *selected = [self.pickerArray objectAtIndex:picker];
        NSString *select = [self.groupArray objectAtIndex:group];
        NSString *message = [[NSString alloc] initWithFormat:@"你选择的是：%@ %@",selected,select];
        NSLog(@"%@",message);

    }
}

-(void)press{
    //UIPickerView对应不同的列轮，显示不同的行
    NSInteger picker = [self.pickerView selectedRowInComponent:0];
    NSInteger group = [self.pickerView selectedRowInComponent:1];
    NSString *selected = [self.pickerArray objectAtIndex:picker];
    
    NSString *select = [self.groupArray objectAtIndex:group];
    NSString *message = [[NSString alloc] initWithFormat:@"你选择的是：%@ %@",selected,select];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    
    

    [alert show];
   
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
