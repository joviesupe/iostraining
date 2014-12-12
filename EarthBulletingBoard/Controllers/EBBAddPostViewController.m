//
//  EBBAddPostViewController.m
//  EarthBulletingBoard
//
//  Created by Jovie Supe on 12/11/14.
//  Copyright (c) 2014 Jovie Francisco Supe. All rights reserved.
//

#import "EBBAddPostViewController.h"


@interface EBBAddPostViewController ()

@end

@implementation EBBAddPostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Dito");
    self.addPost = (EBBAddPostView *)[self getCustomXibUsingXibName:@"AddPost"];
    
    [self.view addSubview:self.addPost];
    self.addPost.frame = CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height);
    self.addPost.delegate=self;

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)saveBtnAction{
    NSString *inputTitle=self.addPost.titleText.text;
    NSString *inputPost=self.addPost.postText.text;

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *inputUser=[defaults objectForKey:@"username"];
    
    NSMutableArray *persistentTitles = [[defaults arrayForKey:@"titles"] mutableCopy];
    NSMutableArray *persistentPosts = [[defaults arrayForKey:@"posts"] mutableCopy];
    NSMutableArray *persistentUsers = [[defaults arrayForKey:@"users"] mutableCopy];
    
    [persistentTitles addObject:inputTitle];
    [persistentPosts addObject:inputPost];
    [persistentUsers addObject:inputUser];
    
    [defaults setObject:persistentUsers forKey:@"users"];
    [defaults setObject:persistentTitles forKey:@"titles"];
    [defaults setObject:persistentPosts forKey:@"posts"];
    
    [self.navigationController popViewControllerAnimated:YES];
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
