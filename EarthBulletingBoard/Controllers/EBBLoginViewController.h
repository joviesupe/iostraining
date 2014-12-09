//
//  EBBLoginViewController.h
//  EarthBulletingBoard
//
//  Created by Jovie Supe on 12/9/14.
//  Copyright (c) 2014 Jovie Francisco Supe. All rights reserved.
//

#import "EBBBaseUIViewController.h"
#import "EBBLoginView.h"

@interface EBBLoginViewController : EBBBaseUIViewController <EBBLoginVieDelegate, UITextFieldDelegate>

@property(strong, nonatomic) EBBLoginView *loginView;

@end
