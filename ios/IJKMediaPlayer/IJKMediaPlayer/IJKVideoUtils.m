//
// Created by Caijinglong on 2019-09-24.
// Copyright (c) 2019 bilibili. All rights reserved.
//

#import "IJKVideoUtils.h"
#import <ijkplayer/ijkplayer.h>

@implementation IJKVideoUtils {

}
+ (CGSize)getSizeWithUrl:(NSString *)url {
    int sizeArray[] = {0, 0};
    int ret = 0;
    const char *string = [url UTF8String];
    if ((ret = (ffmpegGetVideoSize(sizeArray, string))) != 0) {
        NSLog(@"can't get video size, ret = %d", ret);
        return CGSizeZero;
    }
    int width = sizeArray[0];
    int height = sizeArray[1];
    return CGSizeMake(width, height);
}

@end
