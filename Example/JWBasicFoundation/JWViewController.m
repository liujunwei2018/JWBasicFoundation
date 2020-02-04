//
//  JWViewController.m
//  JWBasicFoundation
//
//  Created by liujunwei on 12/17/2019.
//  Copyright (c) 2019 liujunwei. All rights reserved.
//

#import "JWViewController.h"
#import <JWWeakTimer.h>

@interface JWViewController ()

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation JWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.timer = [JWWeakTimer jw_scheduledTimerWithTimeInterval:2 target:self selector:@selector(test) userInfo:nil repeats:YES];
    
}

- (void)test {
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
