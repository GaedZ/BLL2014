//
//  RulesViewController.m
//  BuWeA4
//
//  Created by Georg Zänker on 28.08.13.
//  Copyright (c) 2013 Georg Zänker. All rights reserved.
//

#import "RulesViewController.h"

@interface RulesViewController ()

@end

@implementation RulesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UIImageView *imageView;
    imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BLL_TafelBG"]];
    [self.textView addSubview:imageView];
    [self.textView sendSubviewToBack:imageView ];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [super viewDidUnload];
}
@end
