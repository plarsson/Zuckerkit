//
//  ViewController.m
//  Demo
//
//  Created by Mo Bitar on 8/21/13.
//  Copyright (c) 2013 progenius. All rights reserved.
//

#import "ViewController.h"
#import "Zuckerkit.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self zuckerIn];
    });
}

- (void)zuckerIn
{
    [[Zuckerkit sharedInstance] openSessionWithBasicInfoThenRequestPublishPermissions:^(NSError *error) {
        if(error) {
            [[[UIAlertView alloc] initWithTitle:@"Fail" message:error.description
              delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
            return;
        }
        [[[UIAlertView alloc] initWithTitle:@"Success" message:@"Authorization successful."
          delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
    }];
}

@end
