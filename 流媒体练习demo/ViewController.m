//
//  ViewController.m
//  流媒体练习demo
//
//  Created by Barley on 16/6/23.
//  Copyright © 2016年 Barley. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@property(nonatomic,strong)NSURL *url ;

@property(nonatomic,strong)MPMoviePlayerController *mpc ;

@end

/**
 
 1. 音频流媒体
 http://cc.stream.qqmusic.qq.com/C100001CT6Mt3y5L0b.m4a?fromtag=52
 
 2. hls地址
 http://hls.quanmin.tv/live/144444/playlist.m3u8
 
 3. rtmp地址
 rtmp://live.hkstv.hk.lxdns.com/live/hks
 
 4. http地址
 http://baobab.cdn.wandoujia.com/14468618701471.mp4
 */


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.url = [NSURL URLWithString:@"http://cc.stream.qqmusic.qq.com/C100001CT6Mt3y5L0b.m4a?fromtag=52"];
    

}
- (IBAction)MpcClickBtn:(id)sender {
    
    self.mpc = [[MPMoviePlayerController alloc]initWithContentURL:self.url];
    
    self.mpc.view.frame = CGRectMake(0, 100,self.view.bounds.size.width, 200);
    
    [self.view addSubview:self.mpc.view];
    
    [self.mpc play];
}

- (IBAction)MpvcClickBtn:(id)sender {
    
    MPMoviePlayerViewController *mpvc = [[MPMoviePlayerViewController alloc]initWithContentURL:self.url];
    
    [self presentMoviePlayerViewControllerAnimated:mpvc];
    
}

- (IBAction)AVplayerBtn:(id)sender {
    
    //创建AVplayer
    AVPlayer *avplayer = [AVPlayer playerWithURL:self.url];
    //设置layer
    AVPlayerLayer *avLayer = [AVPlayerLayer playerLayerWithPlayer:avplayer];
    //设置大小
    avLayer.frame = self.view.bounds ;
    
    avLayer.backgroundColor = [UIColor blueColor].CGColor;
    //添加到layer中
    [self.view.layer addSublayer:avLayer];
    //播放,调用paly方法
    [avplayer play];
}
@end
