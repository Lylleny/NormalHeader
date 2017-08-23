//
//  LYAnmationHeader.m
//  LYNetworkingManger
//
//  Created by Lyalleny on 2017/8/22.
//  Copyright © 2017年 Lyalleny. All rights reserved.
//

#import "LYAnmationHeader.h"

#define Width  [UIScreen mainScreen].bounds.size.width

@interface LYAnmationHeader ()
{
    BOOL direction ;
}
@property (nonatomic,strong) UIImageView *anmationImage;
@property (nonatomic,strong) UIImageView *iconImage;
@property (nonatomic,strong) CADisplayLink *link;
@end

@implementation LYAnmationHeader

-(CADisplayLink *)link{
    if (!_link) {
        _link = [CADisplayLink displayLinkWithTarget:self selector:@selector(moveImageView)];
    }
    return _link;
}
-(UIImageView *)anmationImage{
    if (!_anmationImage) {
        _anmationImage = [[UIImageView alloc]init];
        _anmationImage.image = [UIImage imageNamed:@"timg"];
        [self addSubview:_anmationImage];
    }
    return _anmationImage;
}

-(UIImageView *)iconImage{
    if (!_iconImage) {
        _iconImage = [[UIImageView alloc]init];
        _iconImage.image = [UIImage imageNamed:@"detail_return"];
        [self addSubview:_iconImage];
    }
    return _iconImage;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initWithUI];
    }
    return self;
}

- (void)initWithUI{
    self.anmationImage.frame = CGRectMake(0, 0, Width*2, 180);
    [self bringSubviewToFront:self.anmationImage];
        
    [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

-(void)layoutSubviews{
    [super layoutSubviews];

}

- (void)moveImageView{
    CGFloat width = self.anmationImage.frame.size.width;
    CGFloat height = self.anmationImage.frame.size.height;
    CGFloat y = self.anmationImage.frame.origin.y;
    CGFloat x = self.anmationImage.frame.origin.x;

    if(direction){
        x = x -0.1;
        if (x + width <=Width) {
            direction = false;
        }
    }else{
        x = x +0.1;
        if (x >=0) {
            direction = true;
        }
    }
    self.anmationImage.frame = CGRectMake(x, y, width, height);
}
@end
