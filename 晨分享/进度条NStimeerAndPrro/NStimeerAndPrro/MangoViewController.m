//
//  MangoViewController.m
//  NStimeerAndPrro
//
//  Created by scjy on 15/12/18.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import "MangoViewController.h"

@interface MangoViewController ()
{
    float a;
}
@property(nonatomic,retain)NSTimer *timer;
@end

@implementation MangoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor brownColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.frame = CGRectMake(100, 200, 100, 40);
    button.backgroundColor = [UIColor blueColor];
    [button setTitle:@"点击" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button2.frame = CGRectMake(100, 300, 100, 40);
    button2.backgroundColor = [UIColor blueColor];
    [button2 setTitle:@"提示" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(alert) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button2];
    
}
- (void)alert{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请选择" preferredStyle:UIAlertControllerStyleAlert];
   
    
    
    UIAlertAction *action=[UIAlertAction actionWithTitle:@"提示" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"jjdpgfk");
    }];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
    
}


-(void)action{
    if (_timer == nil) {
        self.timer= [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(action2) userInfo:nil repeats:YES];
    }
    
}

- (void)action2{
    a+=1;
    UIProgressView *progress = [[UIProgressView alloc]initWithFrame:CGRectMake(30, 300, self.view.frame.size.width - 60, 44)];
    
    progress.progressTintColor = [UIColor yellowColor];
    progress.trackTintColor = [UIColor magentaColor];
    
    CGAffineTransform transform =CGAffineTransformMakeScale(1.0f, 4.0f);
    progress.transform = transform;
    
    [progress setProgress:a/100 animated:YES];
    [self.view addSubview:progress];
    
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
