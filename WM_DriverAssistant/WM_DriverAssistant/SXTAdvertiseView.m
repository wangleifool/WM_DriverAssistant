//
//  SXTAdvertiseView.m
//  尚学堂映客
//
//  Created by 大欢 on 16/8/30.
//  Copyright © 2016年 大欢. All rights reserved.
//

#import "SXTAdvertiseView.h"
#import "SXTCacheHelper.h"
#import "NSString+CachePath.h"
#import "UIImageView+WebCache.h"

@interface SXTAdvertiseView ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *btSkip;

@end

// 广告显示的时间
static int const showtime = 3;

@implementation SXTAdvertiseView

+ (instancetype)loadAdvertiseView {
    
    return [[[NSBundle mainBundle] loadNibNamed:@"SXTAdvertiseView" owner:self options:nil] lastObject];
}

- (void)awakeFromNib {
    
    [super awakeFromNib];
    
    self.frame = [UIScreen mainScreen].bounds;

    [self showAd];
    
    [self downLoadAd];
    
    [self startCoundown];
}
//展示广告
- (void)showAd {
    
    NSString * fileName = [SXTCacheHelper getAdvertiseImage];
    
    UIImage *lastPreviousCachedImage = [[SDWebImageManager sharedManager].imageCache imageFromDiskCacheForKey:fileName];
    if (!lastPreviousCachedImage) {
        self.hidden = YES;
    } else {
        self.imageView.image = lastPreviousCachedImage;
    }
}

//下载广告
- (void)downLoadAd {
    
    NSURL * imageUrl = [NSURL URLWithString:AdvertisementImageUrl];

    //SDWebImageAvoidAutoSetImage 下载完成不会直接赋值给imageview
    
    [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:imageUrl options:SDWebImageDownloaderHighPriority progress:nil completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, BOOL finished) {
        
        [SXTCacheHelper setAdvertiseImage:AdvertisementImageUrl];
        
        [[SDWebImageManager sharedManager] saveImageToCache:image forURL:imageUrl];
        NSLog(@"广告图片下载成功");
        
    }];
    
}

- (void)startCoundown
{
    __block int timeout = showtime + 1; //倒计时时间 + 1
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0 * NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout <= 0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self dismiss];
                
            });
        }else{
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.btSkip setTitle:[NSString stringWithFormat:@"跳过%d",timeout] forState:UIControlStateNormal];
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}

- (void)dismiss
{
    
    [UIView animateWithDuration:0.3f animations:^{
        
        self.alpha = 0.f;
        
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
        
    }];
    
}

- (IBAction)btSkipPrssed:(id)sender {
    [self dismiss];
}

@end
