//
//  CustomHeaderView.m
//  UITableViewHeaderFooterView
//
//  Created by Felix Wu on 4/20/15.
//  Copyright (c) 2015 Felix Wu. All rights reserved.
//

#import "CustomHeaderView.h"

@implementation CustomHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"test.png"]];
//        imageView.frame = CGRectMake(50, 20, 50, 90);
//        [self addSubview:imageView];
//    }
//    return self;
//}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"test.png"]];
        imageView.frame = CGRectMake(200, 30, 90, 55);
        [self addSubview:imageView];
    }
    return self;
}

@end
