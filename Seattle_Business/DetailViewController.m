//
//  DetailViewController.m
//  Intern_CS117
//
//  Created by Shashank Khanna  on 10/11/16.
//  Copyright © 2016 CS117. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize displayStuff;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    businessName.lineBreakMode = UILineBreakModeWordWrap;
    person.lineBreakMode = UILineBreakModeWordWrap;
    businessName.text = [displayStuff objectForKey:@"business_name"]; // organization
    [businessName sizeToFit];
    person.text = [displayStuff objectForKey:@"location_description"]; // mailing_address,primary_contact_first_name
    [person sizeToFit];
    NSString *name = [displayStuff objectForKey:@"business_name"];
    NSString *trimmed = [name stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *trimmed_no_comma = [trimmed stringByReplacingOccurrencesOfString:@"," withString:@""];
    NSString *email_name = [NSString stringWithFormat:@"%@@gmail.com",trimmed_no_comma];
    email.lineBreakMode = UILineBreakModeWordWrap;
    email.text = [email_name lowercaseString]; //[displayStuff objectForKey:@"mailing_zip_code"]; // email
    [email sizeToFit];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//
//#pragma mark - Navigation
//
//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//    [segue destinationViewController];
//}


@end
