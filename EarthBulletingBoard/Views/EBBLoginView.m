//
//  EBBLoginView.m
//  EarthBulletingBoard
//
//  Created by Jovie Supe on 12/9/14.
//  Copyright (c) 2014 Jovie Francisco Supe. All rights reserved.
//

#import "EBBLoginView.h"

@implementation EBBLoginView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)loginBtnAction:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(loginBtnAction)]) {
        [self.delegate loginBtnAction];
    }
}
@end
