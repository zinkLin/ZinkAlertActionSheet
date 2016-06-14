//
//  ZinkAlert.h
//  SeekingContacts
//
//  Created by kfzx-linz on 16/4/8.
//  Copyright © 2016年 林峥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZinkAlertActionSheet : NSObject

+ (void)zinkAlertWithTitle:(NSString *)title
                   message:(NSString *)message
              cancelButton:(NSString *)cancel
              otherButtons:(NSArray<NSString *> *)buttons
                  callBack:(void(^)(NSInteger index))callBackBlock;

+ (void)zinkActionSheetShowInView:(UIView *)view
                        withTitle:(NSString *)title
                          message:(NSString *)message
                     cancelButton:(NSString *)cancel
                     otherButtons:(NSArray<NSString *> *)buttons
                         callBack:(void(^)(NSInteger index))callBackBlock;

@end
