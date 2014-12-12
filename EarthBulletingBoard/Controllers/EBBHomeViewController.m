//
//  EBBHomeViewController.m
//  EarthBulletingBoard
//
//  Created by Jovie Supe on 12/9/14.
//  Copyright (c) 2014 Jovie Francisco Supe. All rights reserved.
//

#import "EBBHomeViewController.h"

@interface EBBHomeViewController (){

NSMutableArray *titles;
NSMutableArray *posts;
NSMutableArray *users;
    
}

@end

@implementation EBBHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if ([defaults objectForKey:@"isFirstRun"] == nil) {
        NSLog(@"First Run");
        [defaults setObject:@"YES" forKey:@"isFirstRun"];
        
        // init arrays
        titles = [[NSMutableArray alloc] initWithObjects:@"2015 Official Holidays", @"Sports News", @"Current Events",nil];
        posts = [[NSMutableArray alloc] initWithObjects:@"January 1 -New Year", @"PACQUIAO-MAYWEATHER : MAY 2015", @"Berlyn Motel, from 250lbs. to 110lbs.", nil];
        users = [[NSMutableArray alloc] initWithObjects:@"jovie", @"jovie", @"francisco", nil];
        
        // store arrays to NSUserDefaults
        [defaults setObject:titles forKey:@"titles"];
        [defaults setObject:posts forKey:@"posts"];
        [defaults setObject:users forKey:@"users"];
        [defaults synchronize];
    }

    
    self.navigationItem.hidesBackButton = YES;
    self.homeView = (EBBHomeView*)[self getCustomXibUsingXibName:@"HomeView"];
    
    // add login view to view
    [self.view addSubview:self.homeView];
    self.homeView.frame = CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height);
     self.homeView.label.text=[defaults objectForKey:@"username"];
    self.homeView.delegate=self;
    
    self.homeView.tableView.delegate=self;
    
    self.homeView.tableView.dataSource=self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)addPostAction{
       [self performSegueWithIdentifier:@"HomeToPostSegue" sender:self];
}


- (void)logoutAction{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -UITableViewDataSOurce
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *persistentTitles = [[defaults arrayForKey:@"titles"] mutableCopy];
    return persistentTitles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    // check which tableView is currently using this delegate method
    if (tableView == self.homeView.tableView) {
        EBBTableViewCell *postCell ;//= (EBBTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"postCell"];
        
        if (postCell == nil) {
            postCell = [[[NSBundle mainBundle] loadNibNamed:@"PostTableView" owner:nil options:nil] objectAtIndex:0];
        }
        
        // init userdefaults
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        // retrieve users, posts, titles from userdefaults
        NSMutableArray *persistentTitles = [[defaults arrayForKey:@"titles"] mutableCopy];
        NSMutableArray *persistentPosts = [[defaults arrayForKey:@"posts"] mutableCopy];
        NSMutableArray *persistentUsers = [[defaults arrayForKey:@"users"] mutableCopy];
        
        postCell.titles.text = [persistentTitles objectAtIndex:indexPath.row];
        postCell.posts.text = [persistentPosts objectAtIndex:indexPath.row];
        postCell.users.text = [persistentUsers objectAtIndex:indexPath.row];
        
        return postCell;
    }
    
    return nil;
}

#pragma mark -UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Clicked");
    
    // init userdefaults
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    // retrieve users, posts, titles from userdefaults
    NSMutableArray *persistentTitles = [[defaults arrayForKey:@"titles"] mutableCopy];
    NSMutableArray *persistentPosts = [[defaults arrayForKey:@"posts"] mutableCopy];
    NSMutableArray *persistentUsers = [[defaults arrayForKey:@"users"] mutableCopy];
    
    NSString *title = [persistentTitles objectAtIndex:indexPath.row];
    NSString *post = [persistentPosts objectAtIndex:indexPath.row];
    NSString *user  = [persistentUsers objectAtIndex:indexPath.row];
    
    [defaults setObject:title forKey:@"title"];
     [defaults setObject:post forKey:@"post"];
     [defaults setObject:user forKey:@"user"];
  [self performSegueWithIdentifier:@"HomeToViewSegue" sender: nil];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90.0;
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
