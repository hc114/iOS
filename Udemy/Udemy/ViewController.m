//
//  ViewController.m
//  Udemy
//
//  Created by Ho Jeannie on 1/11/16.
//  Copyright © 2016 Ho Jeannie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Button:(id)sender {
    countInt=0;
    self.Label.text = [NSString stringWithFormat:@"%i",countInt];
    timer=[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countTimer) userInfo:nil repeats:YES];
}

-(void)countTimer{
    countInt+=1;
    self.Label.text = [NSString stringWithFormat:@"%i",countInt];
}

@end
