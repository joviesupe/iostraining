//
//  EBBAddPostView.h
//  EarthBulletingBoard
//
//  Created by Jovie Supe on 12/11/14.
//  Copyright (c) 2014 Jovie Francisco Supe. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EBBAddPostDelegate <NSObject>

@required
-(void)saveBtnAction;
@end

@interface EBBAddPostView : UIView
@property (weak, nonatomic) IBOutlet UITextField *titleText;
@property (weak, nonatomic) IBOutlet UITextView *postText;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;

- (IBAction)saveBtnAction:(id)sender;
@property(strong) id <EBBAddPostDelegate> delegate;

@end
