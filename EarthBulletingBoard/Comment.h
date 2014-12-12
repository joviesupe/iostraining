//
//  Comment.h
//  EarthBulletingBoard
//
//  Created by Jovie Supe on 12/11/14.
//  Copyright (c) 2014 Jovie Francisco Supe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Post;

@interface Comment : NSManagedObject

@property (nonatomic, retain) NSString * comment_txt;
@property (nonatomic, retain) NSString * user;
@property (nonatomic, retain) Post *post;

@end
