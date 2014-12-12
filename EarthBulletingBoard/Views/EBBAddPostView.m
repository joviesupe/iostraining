//
//  EBBAddPostView.m
//  EarthBulletingBoard
//
//  Created by Jovie Supe on 12/11/14.
//  Copyright (c) 2014 Jovie Francisco Supe. All rights reserved.
//

#import "EBBAddPostView.h"

@implementation EBBAddPostView


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)saveBtnAction:(id)sender {
          if (self.delegate && [self.delegate respondsToSelector:@selector(saveBtnAction)]) {
            [self.delegate saveBtnAction];
        }
   
}
@end
