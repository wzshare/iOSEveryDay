//
//  ViewController.m
//  WZHLocalPlayer
//
//  Created by wangzhe on 2018/11/5.
//  Copyright © 2018 wangzhe. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "PlayerView.h"
#import "UIView+LayoutSubviewsCallback.h"

@interface ViewController ()
{
    PlayerView *playerView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    playerView = [PlayerView new];
    playerView.translatesAutoresizingMaskIntoConstraints = NO;
    [playerView setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:playerView];
    
    UILayoutGuide *guide = self.view.safeAreaLayoutGuide;
    [playerView.topAnchor constraintEqualToAnchor:guide.topAnchor constant:10].active = YES;
    [playerView.leftAnchor constraintEqualToAnchor:guide.leftAnchor constant:10].active = YES;
    [playerView.rightAnchor constraintEqualToAnchor:guide.rightAnchor constant:-10].active = YES;
    [playerView.heightAnchor constraintEqualToAnchor:playerView.widthAnchor multiplier:(9 / 16.0)].active = YES;
    
    AVPlayerLayer *avLayer = [AVPlayerLayer new];
    [playerView.layer addSublayer:avLayer];
    playerView.layoutSubviewsCallback = ^(UIView *view) {
        avLayer.frame = view.bounds;
        NSLog(@"view");
    };
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"%@", self->playerView);
    });
    
//    [self play:avLayer];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

- (void)play:(AVPlayerLayer *)avLayer {
    NSURL *URL = [NSURL URLWithString:@"http://123.125.37.185/play.videocache.lecloud.com/187/28/92/letv-gug/14/ver_00_22-1051581402-avc-1507856-aac-96000-117151-23680505-2e0b3774490e51ac469db4313025b877-1466497857703.m3u8?crypt=13aa7f2e25900&b=259&nlh=4096&nlt=60&bf=8000&p2p=1&video_type=mp4&termid=2&tss=ios&platid=3&splatid=301&its=0&qos=3&fcheck=0&amltag=5&mltag=5&uid=1875536538.rp&keyitem=GOw_33YJAAbXYE-cnQwpfLlv_b2zAkYctFVqe5bsXQpaGNn3T1-vhw..&ntm=1541490600&nkey=260413cf2c5424adce18371e572b76ec&nkey2=a50b49d126a85fa645ba2a0f3e6b5d4a&auth_key=1541490600-1-0-3-301-dcc31f4ed2a681005a7d14c4d8975a58&geo=CN-1-5-2&mmsid=64759172&tm=1541472334&key=818bfab41bde2d10bf0f89cd921e9fec&playid=0&vtype=21&cvid=1258483890291&payff=0&p1=0&p2=04&ostype=macos&hwtype=iphone&uuid=1472390408661849&vid=29394106&uidx=0&errc=419&gn=3334&ndtype=0&vrtmcd=102&buss=5&cips=111.202.106.154"];
    AVURLAsset *itemAsset = [[AVURLAsset alloc] initWithURL:URL options:nil];
    AVPlayerItem *playItem = [[AVPlayerItem alloc] initWithAsset:itemAsset];
    AVPlayer *player = [[AVPlayer alloc] initWithPlayerItem:playItem];
//    [(AVPlayerLayer *)playerView.layer setPlayer:player];
    [avLayer setPlayer:player];
//    [player setRate:1];
    [player play];
}

@end
