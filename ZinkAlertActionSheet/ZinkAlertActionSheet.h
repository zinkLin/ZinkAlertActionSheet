//
//  ZinkAlert.h
//  SeekingContacts
//
//  Created by kfzx-linz on 16/4/8.
//  Copyright © 2016年 林峥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZinkAlertActionSheet : NSObject

+ (void)zinkAlertShowInController:(UIViewController *)viewController
                            title:(NSString *)title
                          message:(NSString *)message
                     cancelButton:(NSString *)cancel
                     otherButtons:(NSArray<NSString *> *)buttons
                         callBack:(void(^)(NSInteger index))callBackBlock;

+ (void)zinkActionSheetShowInController:(UIViewController *)viewController
                                  title:(NSString *)title
                                message:(NSString *)message
                           cancelButton:(NSString *)cancel
                      destructiveButton:(NSString *)destructive
                           otherButtons:(NSArray<NSString *> *)buttons
                               callBack:(void(^)(NSInteger index))callBackBlock;
@end
