//
//  ZinkAlert.m
//  SeekingContacts
//
//  Created by kfzx-linz on 16/4/8.
//  Copyright © 2016年 林峥. All rights reserved.
//

#import "ZinkAlertActionSheet.h"
#import "ZinkAlertAction.h"

#define ZinkFoundationVersionNumber  NSFoundationVersionNumber_iOS_8_0

typedef NS_ENUM(NSInteger, ViewType) {
    ViewType_Alert,
    ViewType_ActionSheet
};

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

+ (void)zinkAlertShowInController:(UIViewController *)viewController
                            title:(NSString *)title
                          message:(NSString *)message
                     cancelButton:(NSString *)cancel
                     otherButtons:(NSArray<NSString *> *)buttons
                         callBack:(void(^)(NSInteger index))callBackBlock {
    [ZinkAlertActionSheet shareInstance].callBackBlock = callBackBlock;
    
    if (NSFoundationVersionNumber >= ZinkFoundationVersionNumber) {
        [self showInController:viewController
                         title:title
                       message:message
                         style:UIAlertControllerStyleAlert
                  cancelButton:cancel
             destructiveButton:nil
                  otherButtons:buttons];
    } else {
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
}

+ (void)zinkActionSheetShowInController:(UIViewController *)viewController
                                  title:(NSString *)title
                                message:(NSString *)message
                           cancelButton:(NSString *)cancel
                      destructiveButton:(NSString *)destructive
                           otherButtons:(NSArray<NSString *> *)buttons
                               callBack:(void(^)(NSInteger index))callBackBlock {
    [ZinkAlertActionSheet shareInstance].callBackBlock = callBackBlock;
    
    if (NSFoundationVersionNumber >= ZinkFoundationVersionNumber) {
        [self showInController:viewController
                         title:title
                       message:message
                         style:UIAlertControllerStyleActionSheet
                  cancelButton:cancel
             destructiveButton:destructive
                  otherButtons:buttons];
    } else {
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:title
                                                                 delegate:[ZinkAlertActionSheet shareInstance]
                                                        cancelButtonTitle:cancel
                                                   destructiveButtonTitle:destructive
                                                        otherButtonTitles:nil];
        for (NSString *title in buttons) {
            [actionSheet addButtonWithTitle:title];
        }
        [actionSheet showInView:viewController.view];
    }
}

+ (void)showInController:(UIViewController *)viewController
                   title:(NSString *)title
                 message:(NSString *)message
                   style:(UIAlertControllerStyle)style
            cancelButton:(NSString *)cancel
       destructiveButton:(NSString *)destructive
            otherButtons:(NSArray<NSString *> *)buttons {
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:title
                                                                        message:message
                                                                 preferredStyle:style];
    NSInteger index = 0;
    //0
    if (destructive.length > 0) {
        ZinkAlertAction *alertAction = [ZinkAlertAction actionWithTitle:destructive
                                                                  style:UIAlertActionStyleDestructive
                                                                handler:^(UIAlertAction * _Nonnull action) {
                                                                    ZinkAlertAction *zAction = (ZinkAlertAction *)action;
                                                                    [ZinkAlertActionSheet shareInstance].callBackBlock(zAction.tag);
                                                                }];
        alertAction.tag = index;
        index++;
        [controller addAction:alertAction];
    }
    //1
    if (cancel.length > 0) {
        ZinkAlertAction *alertAction = [ZinkAlertAction actionWithTitle:cancel
                                                                  style:UIAlertActionStyleCancel
                                                                handler:^(UIAlertAction * _Nonnull action) {
                                                                    ZinkAlertAction *zAction = (ZinkAlertAction *)action;
                                                                    [ZinkAlertActionSheet shareInstance].callBackBlock(zAction.tag);
                                                                }];
        alertAction.tag = index;
        index++;
        [controller addAction:alertAction];
    }
    //...
    for (NSString *button in buttons) {
        ZinkAlertAction *alertAction = [ZinkAlertAction actionWithTitle:button
                                                                  style:UIAlertActionStyleDefault
                                                                handler:^(UIAlertAction * _Nonnull action) {
                                                                    ZinkAlertAction *zAction = (ZinkAlertAction *)action;
                                                                    [ZinkAlertActionSheet shareInstance].callBackBlock(zAction.tag);
                                                                }];
        alertAction.tag = index;
        index++;
        [controller addAction:alertAction];
    }
    
    [viewController presentViewController:controller
                                 animated:YES
                               completion:nil];
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
