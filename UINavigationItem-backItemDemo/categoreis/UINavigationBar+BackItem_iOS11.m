//
//  UINavigationBar+BackItem.m
//  operationalMaster
//
//  Created by 马遥 on 2017/12/14.
//  Copyright © 2017年 boxfish. All rights reserved.
//

#import "UINavigationBar+BackItem_iOS11.h"
#import "UINavigationItem+BackItem.h"
#import <objc/runtime.h>

@implementation UINavigationBar (BackItem_iOS11)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (@available(iOS 11, *)) {    // iOS 11 以下无效
            Method originalMethodImp = class_getInstanceMethod(self, @selector(pushNavigationItem:animated:));
            Method destMethodImp = class_getInstanceMethod(self, @selector(iOS11CustomPushNavigationItem:animated:));
            method_exchangeImplementations(originalMethodImp, destMethodImp);
        }
    });
}

- (void)iOS11CustomPushNavigationItem:(UINavigationItem *)item animated:(BOOL)animated {
    if (!self.topItem.backBarButtonItem) {
        UIBarButtonItem *itemBarButton = [UINavigationItem customGlobalBackBarButtonItem];
        [self.topItem setBackBarButtonItem:itemBarButton];
    }
    
    [self iOS11CustomPushNavigationItem:item animated:animated];
}

@end
