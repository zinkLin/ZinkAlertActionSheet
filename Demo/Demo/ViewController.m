//
//  ViewController.m
//  Demo
//
//  Created by kfzx-linz on 16/6/23.
//  Copyright © 2016年 ICBC. All rights reserved.
//

#import "ViewController.h"
#import "ZinkAlertActionSheet.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (IBAction)actionAlert:(id)sender {
    [ZinkAlertActionSheet zinkAlertShowInController:self
                                              title:@"title"
                                            message:@"message"
                                       cancelButton:@"cancel"
                                       otherButtons:@[@"1", @"2", @"3"]
                                           callBack:^(NSInteger index) {
                                               NSLog(@"%ld", index);
                                           }];
}

- (IBAction)actionSheet:(id)sender {
    [ZinkAlertActionSheet zinkActionSheetShowInController:self
                                                    title:@"title"
                                                  message:@"message"
                                             cancelButton:@"cancel"
                                        destructiveButton:@"destructive"
                                             otherButtons:@[@"1", @"2"]
                                                 callBack:^(NSInteger index) {
                                                     NSLog(@"%ld", index);
                                                 }];
}

@end
