//
//  EBBHomeView.m
//  EarthBulletingBoard
//
//  Created by Jovie Supe on 12/10/14.
//  Copyright (c) 2014 Jovie Francisco Supe. All rights reserved.
//

#import "EBBHomeView.h"

@implementation EBBHomeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (IBAction)addPostAction:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(addPostAction)]) {
        [self.delegate addPostAction];
    }
}

- (IBAction)logoutAction:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(logoutAction)]) {
        [self.delegate logoutAction];
    }
}
@end
