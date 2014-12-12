//
//  EBBTableViewCell.h
//  EarthBulletingBoard
//
//  Created by Jovie Supe on 12/10/14.
//  Copyright (c) 2014 Jovie Francisco Supe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EBBTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titles;
@property (weak, nonatomic) IBOutlet UILabel *posts;
@property (weak, nonatomic) IBOutlet UILabel *users;

@end
