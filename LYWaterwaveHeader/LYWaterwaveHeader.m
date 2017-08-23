//
//  LYWaterwaveHeader.m
//  Exam
//
//  Created by wangshubing on 2017/8/23.
//  Copyright © 2017年 Lyalleny. All rights reserved.
//

#import "LYWaterwaveHeader.h"

@interface LYWaterwaveHeader ()

{
    CGFloat _waveAmplitude;      //!< 振幅
    CGFloat _waveCycle;          //!< 周期
    CGFloat _waveSpeed;          //!< 速度
    CGFloat _waterWaveHeight;
    CGFloat _waterWaveWidth;
    CGFloat _wavePointY;
    CGFloat _waveOffsetX;            //!< 波浪x位移
    UIColor *_waveColor;             //!< 波浪颜色
    
    CGFloat _waveSpeed2;
}

@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic,strong) CAShapeLayer *firstWaveLayer;
@property (nonatomic,strong) CAShapeLayer *secondeWaveLayer;

@end
@implementation LYWaterwaveHeader


- (CAShapeLayer *)firstWaveLayer
{
    if (!_firstWaveLayer) {
        _firstWaveLayer = [CAShapeLayer layer];
        _firstWaveLayer.fillColor = _waveColor.CGColor;
    }
    return _firstWaveLayer;
}

- (CAShapeLayer *)secondeWaveLayer
{
    if (!_secondeWaveLayer) {
        _secondeWaveLayer = [CAShapeLayer layer];
        _secondeWaveLayer.fillColor = _waveColor.CGColor;
    }
    return _secondeWaveLayer;
}


- (CADisplayLink *)displayLink
{
    if (!_displayLink) {
        _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(generateWave)];
    }
    return _displayLink;
}


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blueColor];
        self.layer.masksToBounds = YES;
        [self configeData];
        [self addSublayer];
    }
    return self;
}

- (void)configeData{
    _waterWaveWidth = self.frame.size.width;
    _waterWaveHeight = 200;
    _waveColor = [UIColor colorWithRed:0.9 green:0.3 blue:0.4 alpha:0.1];
    _waveSpeed = 0.25/M_PI;
    _waveSpeed2 = 0.3/M_PI;
    _waveOffsetX = 0;
    _wavePointY = _waterWaveHeight - 50;
    _waveAmplitude = 13;
    _waveCycle =  1.29 * M_PI / _waterWaveWidth;
}


- (void)addSublayer{
    [self.layer addSublayer:self.firstWaveLayer];
    [self.layer addSublayer:self.secondeWaveLayer];
    
    [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)generateWave{
    _waveOffsetX += _waveSpeed;
    [self setFirstWave];
    [self setSecondWave];
}

- (void)setFirstWave{
    CGMutablePathRef path = CGPathCreateMutable();
    CGFloat y = _wavePointY;
    CGPathMoveToPoint(path, nil, 0, y);
    for (CGFloat x =0.00; x <_waterWaveWidth; x ++) {
        y = _waveAmplitude *sin(_waveCycle*x+_waveOffsetX)+_wavePointY;
        CGPathAddLineToPoint(path, nil, x, y);
    }
    
    CGPathAddLineToPoint(path, nil, _waterWaveWidth, self.frame.size.height);
    CGPathAddLineToPoint(path, nil, 0, self.frame.size.height);
    CGPathCloseSubpath(path);
    
    self.firstWaveLayer.path = path;
    CGPathRelease(path);
}

- (void)setSecondWave{
    CGMutablePathRef path = CGPathCreateMutable();
    CGFloat y = _wavePointY;
    CGPathMoveToPoint(path, nil, 0, y);
    for (CGFloat x =0.00; x <_waterWaveWidth; x ++) {
        y = (_waveAmplitude+3) *sin(_waveCycle*x+_waveOffsetX+15)+_wavePointY;
        CGPathAddLineToPoint(path, nil, x, y);
    }
    
    CGPathAddLineToPoint(path, nil, _waterWaveWidth, self.frame.size.height);
    CGPathAddLineToPoint(path, nil, 0, self.frame.size.height);
    CGPathCloseSubpath(path);
    
    self.secondeWaveLayer.path = path;
    CGPathRelease(path);
}

@end
