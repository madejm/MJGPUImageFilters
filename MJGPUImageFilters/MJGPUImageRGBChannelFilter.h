//
//  MJGPUImageRGBChannelFilter.h
//  MJGPUImageFilters
//
//  Created by Mateusz Madej on 16/12/2019.
//  Copyright © 2019 Mateusz Madej. All rights reserved.
//

#import <GPUImage/GPUImage.h>

@interface MJGPUImageRGBChannelFilter : GPUImageFilter
{
    GLint red_redUniform;
    GLint red_greenUniform;
    GLint red_blueUniform;
    GLint green_redUniform;
    GLint green_greenUniform;
    GLint green_blueUniform;
    GLint blue_redUniform;
    GLint blue_greenUniform;
    GLint blue_blueUniform;
}

// Normalized values by which each color channel is multiplied. The range is from 0.0 up.
@property (readwrite, nonatomic) CGFloat red_red; // 1.0 default
@property (readwrite, nonatomic) CGFloat red_green;
@property (readwrite, nonatomic) CGFloat red_blue;
@property (readwrite, nonatomic) CGFloat green_red;
@property (readwrite, nonatomic) CGFloat green_green; // 1.0 default
@property (readwrite, nonatomic) CGFloat green_blue;
@property (readwrite, nonatomic) CGFloat blue_red;
@property (readwrite, nonatomic) CGFloat blue_green;
@property (readwrite, nonatomic) CGFloat blue_blue; // 1.0 default

@end
