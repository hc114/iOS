//
//  ViewController.h
//  Udemy
//
//  Created by Ho Jeannie on 1/11/16.
//  Copyright © 2016 Ho Jeannie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    //we put it in the curly brackets because it is inside the viewcontroller
    NSTimer *timer;
    int countInt;
    
}
- (IBAction)Button:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *Label;

@end

