//
//  DetailViewController.h
//  Intern_CS117
//
//  Created by Shashank Khanna  on 10/11/16.
//  Copyright © 2016 CS117. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController{
    
    NSDictionary *displayStuff;
    IBOutlet UILabel * businessName; 
    IBOutlet UILabel * person; 
    IBOutlet UILabel * email; 

    
    
}
@property (nonatomic,copy) NSDictionary *displayStuff; 
@end
