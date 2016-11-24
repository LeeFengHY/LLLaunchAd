# 一款简易的开机广告API

[![Support](https://img.shields.io/badge/Support-iOS%207%2B-blue.svg)](https://www.apple.com/nl/ios/)&nbsp;
[![Wercker](https://img.shields.io/wercker/ci/wercker/docs.svg)](https://www.github.com/LeeFengHY/LLLaunchAd)

# Demo Project 

<img src="https://raw.github.com/LeeFengHY/LLLaunchAd/master/LLLaunchAd/ad.png" width="320">

# 使用
1.把LLLaunchAd文件夹拖入到你的项目中<br />
2.设置好 imageUrl, 支持静态广告和GIF广告, `LaunchTypeTimeText` `duration` `adFrame`<br />
3.代码如下

```objc
- (void)example
{
    [LLLaunchAdView showWithAdFrame:CGRectMake(0, 0,self.window.bounds.size.width, self.window.bounds.size.height - 150)
                    setAdImageBlock:^(LLLaunchAdView *launchAdView) {
        
       [self requestImageData:^(NSString *imgUrl, NSInteger duration, NSString *openUrl) {
           [launchAdView setImageUrl:imgUrl duration:duration launchType:LaunchTypeTimeText options:LaunchAdImageDefault completed:^(UIImage *image, NSURL *URL) {
               //图片下载完成回调
               
           } adImageClickBlock:^(NSString *url) {
               ViewController *vc = [[ViewController alloc] init];
               UIViewController *fromVc = [[UIApplication sharedApplication].delegate window].rootViewController;
               [fromVc presentViewController:vc animated:NO completion:^{
                   
               }];
               NSLog(@"image url:%@",url);
           }];
       }];
        
    } showFinish:^{
        ViewController *vc = [[ViewController alloc] init];
        [[UIApplication sharedApplication].delegate window].rootViewController = vc;
    }];
}
/**
 *  模拟:向服务器请求广告数据
 *
 *  @param imageData 回调imageUrl,及停留时间,跳转链接
 */
-(void)requestImageData:(void(^)(NSString *imgUrl,NSInteger duration,NSString *openUrl))imageData{
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        if(imageData)
        {
            imageData(ImgUrlString1,10,@"https://www.github.com/LeeFengHY");
        }
    });
    
}
```
#联系
1.与其狠狠的给我一个Star, 不如痛快的给我提个issue!<br />
2.欢迎交流QQ:578545715
