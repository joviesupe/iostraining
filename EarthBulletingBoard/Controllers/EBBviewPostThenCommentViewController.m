//
//  EBBviewPostThenCommentViewController.m
//  EarthBulletingBoard
//
//  Created by Jovie Supe on 12/11/14.
//  Copyright (c) 2014 Jovie Francisco Supe. All rights reserved.
//

#import "EBBviewPostThenCommentViewController.h"

@interface EBBviewPostThenCommentViewController ()

@end

@implementation EBBviewPostThenCommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.hidesBackButton = YES;
    self.viewPost = (EBBViewPostThenCommentView*)[self getCustomXibUsingXibName:@"viewPostThenComment"];
    
    // add login view to view
    [self.view addSubview:self.viewPost];
    self.viewPost.frame = CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height);
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *user = [defaults objectForKey:@"users"];
    NSString *title = [defaults objectForKey:@"titles"];
    NSString *post = [defaults objectForKey:@"posts"];
    self.viewPost.title.text=title;
    self.viewPost.user.text=user;
    self.viewPost.post.text=post;
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
