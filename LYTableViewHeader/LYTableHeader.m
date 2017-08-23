//
//  LYTableHeader.m
//  LYNetworkingManger
//
//  Created by Lyalleny on 2017/8/23.
//  Copyright © 2017年 Lyalleny. All rights reserved.
//

#import "LYTableHeader.h"

#define Width  [UIScreen mainScreen].bounds.size.width

@interface LYTableHeader ()
{
    CGFloat h;

}
@property (nonatomic,strong) UIImageView *headerImage;
@property (nonatomic,assign)  CGFloat offset;
@end

@implementation LYTableHeader

-(UIImageView *)headerImage{
    if (!_headerImage) {
        _headerImage = [[UIImageView alloc]init];
        _headerImage.image = [UIImage imageNamed:@"timg"];
        [self addSubview:_headerImage];
    }
    return _headerImage;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)initializeUI{
    self.headerImage.frame = CGRectMake(0, 0, Width, 150);
}

- (void)updateImageFram:(CGFloat)offset{
    self.offset = offset;
    [self layoutIfNeeded];
    [self setNeedsLayout];
}

-(void)layoutSubviews{
    if (self.offset<=0) {
        self.clipsToBounds = NO;
        self.headerImage.frame = CGRectMake(0, self.offset, Width, 150 - self.offset);
    }else{
        self.clipsToBounds = YES;
        self.headerImage.frame = CGRectMake(0, 0, Width, 150 );
    }
    [super layoutSubviews];

}
@end
