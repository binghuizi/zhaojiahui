//
//  MangoViewController.m
//  Musick
//
//  Created by scjy on 15/12/24.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import "MangoViewController.h"

@interface MangoViewController ()
//播放器
@property(nonatomic,retain) AVAudioPlayer *avAudioPlayer;
//进度条
@property(nonatomic,retain) UIProgressView *progressView;
//音量控制
@property(nonatomic,retain) UISlider *volumeSlider;
//监控音频控制
@property(nonatomic,retain) NSTimer *timer;
@end

@implementation MangoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"音乐播放器";
    
    //创建三个按钮1.播放 2.暂停
    
    //第一个：播放
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:CGRectMake(100, 100, 60, 40)];
    [button setTitle:@"Play" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(play) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    //第二个暂停
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button1 setFrame:CGRectMake(100, 150, 60, 40)];
    [button1 setTitle:@"pause" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(pause) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    //第三个停止
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button2 setFrame:CGRectMake(100, 200, 60, 40)];
    [button2 setTitle:@"stop" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(stop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    //读取音频
    NSString *path = [[NSBundle mainBundle]pathForResource:@"My Prayer" ofType:@".mp3"];
    //URL格式
    
    NSURL *url = [NSURL fileURLWithPath:path];
    //初始化播放器
    self.avAudioPlayer =[[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
    //设置代理
    self.avAudioPlayer.delegate = self;
    //准备播放
    [self.avAudioPlayer prepareToPlay];
    //初始化进度条
    self.progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(20, 50, self.view.frame.size.width - 60, 20)];
    [self.view addSubview:self.progressView];
    //监控播放进度
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(playPro) userInfo:nil repeats:YES];
    //音量
    self.volumeSlider = [[UISlider alloc]initWithFrame:CGRectMake(50, 400, 300, 20)];
    [self.volumeSlider addTarget:self action:@selector(chageVolume) forControlEvents:UIControlEventValueChanged];
    
    //音量最大 最小
    self.volumeSlider.minimumValue = 0.0;
    self.volumeSlider.maximumValue = 5.0;
    //打开音量
    self.volumeSlider.value = 3.0;
    [self.view addSubview:self.volumeSlider];
    
    
}
- (void)playPro{
    //通过播放器 当前时间与整体时长的比值 给progress 赋值
    self.progressView.progress = self.avAudioPlayer.currentTime / self.avAudioPlayer.duration;
}
//控制音量大小
-(void)chageVolume{
    self.avAudioPlayer.volume = self.volumeSlider.value;
}
//开始播放
- (void)play{
    [self.avAudioPlayer play];
    
}
//暂停
-(void)pause{
    [self.avAudioPlayer pause];
}
//停止播放
- (void)stop{
    self.avAudioPlayer.currentTime = 0;
    [self.avAudioPlayer stop];
    
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
