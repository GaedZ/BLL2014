//
//  BackgroundUIView.m
//  BuWeA4
//
//  Created by Niklas Riekenbrauck on 02.09.13.
//  Copyright (c) 2013 Georg Zänker. All rights reserved.
//

#import "BackgroundUIView.h"
#import "CreditsViewController.h"

@implementation BackgroundUIView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _init];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self _init];
    }
    return self;
}

-(void)_init {
    UIImageView *imageView;
    if ([[self viewController] isMemberOfClass: [CreditsViewController class]]) {
        imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BlackBoard.png"]];
    } else {
        imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BLL_TafelBG"]];
    }
    [self addSubview:imageView];
    [self sendSubviewToBack:imageView ];
}

- (UIViewController*)viewController
{
    for (UIView* next = [self superview]; next; next = next.superview)
    {
        UIResponder* nextResponder = [next nextResponder];
        
        if ([nextResponder isKindOfClass:[UIViewController class]])
        {
            return (UIViewController*)nextResponder;
        }
    }
    
    return nil;
}

@end
