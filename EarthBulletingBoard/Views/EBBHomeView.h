//
//  EBBHomeView.h
//  EarthBulletingBoard
//
//  Created by Jovie Supe on 12/10/14.
//  Copyright (c) 2014 Jovie Francisco Supe. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol EBBHomeViewDelegate <NSObject>
@required
- (void) addPostAction;

- (void) logoutAction;
@end

@interface EBBHomeView : UIView
@property (weak, nonatomic) IBOutlet UIButton *addPost;
@property (weak, nonatomic) IBOutlet UIButton *logout;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)addPostAction:(id)sender;
@property(strong) id <EBBHomeViewDelegate> delegate;

- (IBAction)logoutAction:(id)sender;

@end
