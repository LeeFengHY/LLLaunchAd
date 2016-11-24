//
//  AppDelegate.m
//  LLLaunchAd
//
//  Created by QFWangLP on 2016/11/22.
//  Copyright © 2016年 LeeFengHY. All rights reserved.
//

#import "AppDelegate.h"
#import "LLLaunchAdView.h"
#import "ViewController.h"

//静态广告
#define ImgUrlString1 @"http://d.hiphotos.baidu.com/image/pic/item/14ce36d3d539b60071473204e150352ac75cb7f3.jpg"
//动态广告
#define ImgUrlString2 @"http://c.hiphotos.baidu.com/image/pic/item/d62a6059252dd42a6a943c180b3b5bb5c8eab8e7.jpg"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    /**
     *  启动页广告
     */
    [self example];
    return YES;
}
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
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
