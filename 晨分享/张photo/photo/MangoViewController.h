//
//  MangoViewController.h
//  photo
//
//  Created by scjy on 15/12/25.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol a <NSObject>

- (void)string:(NSString *)path;


-(void)data:(NSData *)data;

@end


@interface MangoViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property(nonatomic, assign) id<a>delegate;

@property(nonatomic, retain) UIImageView *imageview;
@end
