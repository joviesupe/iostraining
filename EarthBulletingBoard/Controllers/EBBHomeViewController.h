//
//  EBBHomeViewController.h
//  EarthBulletingBoard
//
//  Created by Jovie Supe on 12/9/14.
//  Copyright (c) 2014 Jovie Francisco Supe. All rights reserved.
//

#import "EBBBaseUIViewController.h"
#import "EBBHomeView.h"
#import "EBBTableViewCell.h"

@interface EBBHomeViewController : EBBBaseUIViewController <EBBHomeViewDelegate, UITableViewDelegate, UITableViewDataSource>
@property(strong, nonatomic) EBBHomeView *homeView;
@property (strong, nonatomic) EBBTableViewCell *postTableView;
@end
