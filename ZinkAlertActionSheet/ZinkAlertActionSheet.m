//
//  ZinkAlert.m
//  SeekingContacts
//
//  Created by kfzx-linz on 16/4/8.
//  Copyright © 2016年 林峥. All rights reserved.
//

#import "ZinkAlertActionSheet.h"

@interface ZinkAlertActionSheet()<UIAlertViewDelegate, UIActionSheetDelegate>

@property (copy, nonatomic) void(^callBackBlock)(NSInteger index);

@end

@implementation ZinkAlertActionSheet

+ (ZinkAlertActionSheet *)shareInstance {
    static ZinkAlertActionSheet *alertActionSheet;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        alertActionSheet = [ZinkAlertActionSheet new];
    });
    
    
    return alertActionSheet;
}

+ (void)zinkAlertWithTitle:(NSString *)title
                   message:(NSString *)message
              cancelButton:(NSString *)cancel
              otherButtons:(NSArray<NSString *> *)buttons
                  callBack:(void(^)(NSInteger index))callBackBlock {

    [ZinkAlertActionSheet shareInstance].callBackBlock = callBackBlock;
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:[ZinkAlertActionSheet shareInstance]
                                          cancelButtonTitle:cancel
                                          otherButtonTitles:nil];
    for (NSString *title in buttons) {
        [alert addButtonWithTitle:title];
    }
    [alert show];
}

+ (void)zinkActionSheetShowInView:(UIView *)view
                        withTitle:(NSString *)title
                          message:(NSString *)message
                     cancelButton:(NSString *)cancel
                     otherButtons:(NSArray<NSString *> *)buttons
                         callBack:(void(^)(NSInteger index))callBackBlock {
    [ZinkAlertActionSheet shareInstance].callBackBlock = callBackBlock;
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:title
                                                             delegate:[ZinkAlertActionSheet shareInstance]
                                                    cancelButtonTitle:cancel
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:nil];
    for (NSString *title in buttons) {
        [actionSheet addButtonWithTitle:title];
    }
    [actionSheet showInView:view];
}

#pragma mark UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    [ZinkAlertActionSheet shareInstance].callBackBlock(buttonIndex);
}

#pragma mark UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    [ZinkAlertActionSheet shareInstance].callBackBlock(buttonIndex);
}

@end
