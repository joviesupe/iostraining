//
//  EBBLoginViewController.m
//  EarthBulletingBoard
//
//  Created by Jovie Supe on 12/9/14.
//  Copyright (c) 2014 Jovie Francisco Supe. All rights reserved.
//

#import "EBBLoginViewController.h"

@interface EBBLoginViewController () {
    UITextField *activeField;
    NSArray *users;
    NSMutableArray *passwords;
}

@end

@implementation EBBLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
    // load xib into view
    self.loginView = (EBBLoginView*)[self getCustomXibUsingXibName:@"LoginView"];
    
    // Set delegates
    self.loginView.delegate = self; // implements login view delegate
    self.loginView.usernameText.delegate = self;
    self.loginView.passwordText.delegate = self;
    
    [self registerForKeyboardNotifications];
    
    // add login view to view
    [self.view addSubview:self.loginView];
    self.loginView.frame = CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height);
    users =[[NSArray alloc] initWithObjects:@"jovie",@"francisco", nil];
    passwords =[[NSMutableArray alloc] initWithObjects:@"jovie",@"francisco", nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) loginBtnAction{
    NSLog(@"login button pressed");
    NSString *message=@"";
 //   [self performSegueWithIdentifier:@"LoginToHomeSegue" sender:self];
    
    NSString *inputUsername = self.loginView.usernameText.text;
    NSString *inputPassword = self.loginView.passwordText.text;
    
    if (![inputUsername isEqualToString:@""] && ![inputPassword isEqualToString:@""]){
        if([users containsObject:inputUsername]&& [passwords containsObject:inputPassword]){
            NSInteger userIndex = [users indexOfObject:inputUsername];
            NSInteger passwordIndex = [passwords indexOfObject:inputPassword];
            
            if(userIndex==passwordIndex){
                NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                [defaults setObject:inputUsername forKey:@"username"];
                
                [self performSegueWithIdentifier:@"LoginToHomeSegue" sender:self];
            }
            else
            message=@"Username and Password do not match";
        }
        else message=@"Username and Password do not match";
    }else{
        message=@"Please Enter username and password";
    }
    if(![message isEqualToString:@""]){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"ALERT" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
}

#pragma mark - UITestField Delegates
- (void) textFieldDidBeginEditing:(UITextField *)textField{
    activeField = textField;
}

- (void) textFieldDidEndEditing:(UITextField *)textField{
    activeField = nil;
    
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - Keyboard
- (void)registerForKeyboardNotifications {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHidden:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardWasShown:(NSNotification *)aNotification {
    // Get size of displayed keyboard
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    // Compute visible active field
    CGRect visibleActiveFieldRect = CGRectMake(activeField.frame.origin.x, activeField.frame.origin.y + kbSize.height, activeField.frame.size.width, activeField.frame.size.height);
    
    // Adjust scroll view content size
    self.loginView.loginScrollViewOutlet.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height + kbSize.height);
    
    // Scroll to visible active field
    [self.loginView.loginScrollViewOutlet scrollRectToVisible:visibleActiveFieldRect animated:YES];
    
}

- (void)keyboardWillBeHidden:(NSNotification *)aNotification {
    // Reset the content size of the scroll view
    self.loginView.loginScrollViewOutlet.contentSize = CGSizeMake(0.0, 0.0);
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
