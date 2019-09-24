/*
 * Copyright (C) 2015 Gdier
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "IJKDemoInputURLViewController.h"
#import "IJKMoviePlayerViewController.h"
#import <IJKMediaFramework/IJKVideoUtils.h>

@interface IJKDemoInputURLViewController () <UITextViewDelegate>

@property(nonatomic,strong) IBOutlet UITextView *textView;

@end

@implementation IJKDemoInputURLViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.title = @"Input URL";
        
        [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Play" style:UIBarButtonItemStyleDone target:self action:@selector(onClickPlayButton)]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textView.text = @"http://img.ksbbs.com/asset/Mon_1703/05cacb4e02f9d9e.mp4";
    self.textView.text = @"https://media001.geekbang.org/f433fd1ce5e84d27b1101f0dad72a126/de563bb4aba94b5f95f448b33be4dd9f-9aede6861be944d696fe365f3a33b7b4-sd.m3u8";
}

- (void)onClickPlayButton {
    NSString* inputString = self.textView.text;
    CGSize size = [IJKVideoUtils getSizeWithUrl:inputString];
    
    NSLog(@"size : width : %f, height: %f",size.width, size.height);
    
    NSURL *url = [NSURL URLWithString:self.textView.text];
    NSString *scheme = [[url scheme] lowercaseString];
    
    if ([scheme isEqualToString:@"http"]
        || [scheme isEqualToString:@"https"]
        || [scheme isEqualToString:@"rtmp"]) {
        [IJKVideoViewController presentFromViewController:self withTitle:[NSString stringWithFormat:@"URL: %@", url] URL:url completion:^{
//            [self.navigationController popViewControllerAnimated:NO];
        }];
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    [self onClickPlayButton];
}

@end
