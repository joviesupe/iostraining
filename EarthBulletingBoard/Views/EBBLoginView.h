//
//  EBBLoginView.h
//  EarthBulletingBoard
//
//  Created by Jovie Supe on 12/9/14.
//  Copyright (c) 2014 Jovie Francisco Supe. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol EBBLoginVieDelegate <NSObject>
@required
- (void) loginBtnAction;

@end

@interface EBBLoginView : UIView

@property (weak, nonatomic) IBOutlet UITextField *usernameText;
@property (weak, nonatomic) IBOutlet UITextField *passwordText;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIScrollView *loginScrollViewOutlet;

- (IBAction)loginBtnAction:(id)sender;
@property(strong) id <EBBLoginVieDelegate> delegate;

@end
