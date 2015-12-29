//
//  SecondViewController.h
//  Photo
//
//  Created by scjy on 15/12/28.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol a <NSObject>//设置代理传值

- (void)string:(NSString *)path;


-(void)data:(NSData *)data;

@end

@interface SecondViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property(nonatomic, assign) id<a>delegate;

@property(nonatomic, retain) UIImageView *imageview;

@end
