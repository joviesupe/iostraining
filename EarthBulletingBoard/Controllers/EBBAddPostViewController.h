//
//  EBBAddPostViewController.h
//  EarthBulletingBoard
//
//  Created by Jovie Supe on 12/11/14.
//  Copyright (c) 2014 Jovie Francisco Supe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EBBAddPostView.h"
#import "EBBBaseUIViewController.h"

@interface EBBAddPostViewController : EBBBaseUIViewController  <EBBAddPostDelegate, UITextViewDelegate, UITextFieldDelegate>
@property (strong, nonatomic) EBBAddPostView *addPost;

@end
