//
//  ViewController.m
//  OtherLib
//
//  Created by bever on 16/3/8.
//  Copyright © 2016年 bever. All rights reserved.
//

#import "ViewController.h"
#import "FSAudioStream.h"


@interface ViewController ()

@property(nonatomic,strong)FSAudioStream *audioStream;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.audioStream play];
    
}


-(NSURL *)getURL{
//NSString *str =@"http://www.300.la/filestores/2016/02/20/692de68936d75eea6da4a75f87f3ab2f.mp3";
    NSString *str =@"http://www.300.la/filestores/2014/08/20/93fde37c2aeae22c61a9c7b70b247f92.mp3";
    
    
    NSURL *url =[NSURL URLWithString:str];

    return url;
}


-(FSAudioStream *)audioStream{

    if (!_audioStream) {
        _audioStream =[[FSAudioStream alloc]initWithUrl:[self getURL]];
        
        _audioStream.onFailure =^(FSAudioStreamError error,NSString *str){
        
            NSLog(@"%@",str);
        
        };
        
        _audioStream.onCompletion =^(){
        
            NSLog(@"播放完毕");
        
        };
        
        [_audioStream setVolume:0.7];
    }
    return _audioStream;
}



@end
