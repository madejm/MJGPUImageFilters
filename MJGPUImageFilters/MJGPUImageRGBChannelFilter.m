//
//  MJGPUImageRGBChannelFilter.m
//  MJGPUImageFilters
//
//  Created by Mateusz Madej on 16/12/2019.
//  Copyright © 2019 Mateusz Madej. All rights reserved.
//

#import "MJGPUImageRGBChannelFilter.h"

#if TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE
NSString *const kMJGPUImageRGBChannelFragmentShaderString = SHADER_STRING
(
 varying highp vec2 textureCoordinate;
 
 uniform sampler2D inputImageTexture;
 uniform highp float red_redAdjustment;
 uniform highp float red_greenAdjustment;
 uniform highp float red_blueAdjustment;
 uniform highp float green_redAdjustment;
 uniform highp float green_greenAdjustment;
 uniform highp float green_blueAdjustment;
 uniform highp float blue_redAdjustment;
 uniform highp float blue_greenAdjustment;
 uniform highp float blue_blueAdjustment;
 
 void main()
 {
     highp vec4 textureColor = texture2D(inputImageTexture, textureCoordinate);
     
     gl_FragColor = vec4(textureColor.r * red_redAdjustment + textureColor.g * red_greenAdjustment + textureColor.b * red_blueAdjustment, textureColor.r * green_redAdjustment + textureColor.g * green_greenAdjustment + textureColor.b * green_blueAdjustment, textureColor.r * blue_redAdjustment + textureColor.g * blue_greenAdjustment + textureColor.b * blue_blueAdjustment, textureColor.a);
 }
);
#endif

@implementation MJGPUImageRGBChannelFilter

@synthesize red_red = _red_red, red_green = _red_green, red_blue = _red_blue, green_red = _green_red, green_green = _green_green, green_blue = _green_blue, blue_red = _blue_red, blue_green = _blue_green, blue_blue = _blue_blue;

#pragma mark -
#pragma mark Initialization and teardown

- (id)init;
{
    if (!(self = [super initWithFragmentShaderFromString:kMJGPUImageRGBChannelFragmentShaderString]))
    {
        return nil;
    }
    
    red_redUniform = [filterProgram uniformIndex:@"red_redAdjustment"];
    self.red_red = 1.0;
    
    red_greenUniform = [filterProgram uniformIndex:@"red_greenAdjustment"];
    self.red_green = 0.0;
    
    red_blueUniform = [filterProgram uniformIndex:@"red_blueAdjustment"];
    self.red_blue = 0.0;
    
    green_redUniform = [filterProgram uniformIndex:@"green_redAdjustment"];
    self.green_red = 0.0;
    
    green_greenUniform = [filterProgram uniformIndex:@"green_greenAdjustment"];
    self.green_green = 1.0;
    
    green_blueUniform = [filterProgram uniformIndex:@"green_blueAdjustment"];
    self.green_blue = 0.0;
    
    blue_redUniform = [filterProgram uniformIndex:@"blue_redAdjustment"];
    self.blue_red = 0.0;
    
    blue_greenUniform = [filterProgram uniformIndex:@"blue_greenAdjustment"];
    self.blue_green = 0.0;
    
    blue_blueUniform = [filterProgram uniformIndex:@"blue_blueAdjustment"];
    self.blue_blue = 1.0;
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setRed_red:(CGFloat)newValue;
{
    _red_red = newValue;
    
    [self setFloat:_red_red forUniform:red_redUniform program:filterProgram];
}

- (void)setRed_green:(CGFloat)newValue;
{
    _red_green = newValue;
    
    [self setFloat:_red_green forUniform:red_greenUniform program:filterProgram];
}

- (void)setRed_blue:(CGFloat)newValue;
{
    _red_blue = newValue;
    
    [self setFloat:_red_blue forUniform:red_blueUniform program:filterProgram];
}

- (void)setGreen_red:(CGFloat)newValue;
{
    _green_red = newValue;

    [self setFloat:_green_red forUniform:green_redUniform program:filterProgram];
}

- (void)setGreen_green:(CGFloat)newValue;
{
    _green_green = newValue;

    [self setFloat:_green_green forUniform:green_greenUniform program:filterProgram];
}

- (void)setGreen_blue:(CGFloat)newValue;
{
    _green_blue = newValue;

    [self setFloat:_green_blue forUniform:green_blueUniform program:filterProgram];
}

- (void)setBlue_red:(CGFloat)newValue;
{
    _blue_red = newValue;

    [self setFloat:_blue_red forUniform:blue_redUniform program:filterProgram];
}

- (void)setBlue_green:(CGFloat)newValue;
{
    _blue_green = newValue;

    [self setFloat:_blue_green forUniform:blue_greenUniform program:filterProgram];
}

- (void)setBlue_blue:(CGFloat)newValue;
{
    _blue_blue = newValue;

    [self setFloat:_blue_blue forUniform:blue_blueUniform program:filterProgram];
}

@end
