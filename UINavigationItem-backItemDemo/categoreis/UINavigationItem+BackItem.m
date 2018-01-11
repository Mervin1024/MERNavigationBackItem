//
//  UINavigationItem+BackItem.m
//  operationalMaster
//
//  Created by mervin on 2016/10/17.
//  Copyright © 2016年 boxfish. All rights reserved.
//

#import "UINavigationItem+BackItem.h"
#import <objc/runtime.h>

@implementation UINavigationItem (BackItem)

+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (@available(iOS 11.0, *)) {
            // iOS 11 无效
        } else {
            Method originalMethodImp = class_getInstanceMethod(self, @selector(backBarButtonItem));
            Method destMethodImp = class_getInstanceMethod(self, @selector(myCustomBackButton_backBarbuttonItem));
            method_exchangeImplementations(originalMethodImp, destMethodImp);
        }
    });
}

static char kCustomBackButtonKey;

-(UIBarButtonItem *)myCustomBackButton_backBarbuttonItem{
    UIBarButtonItem *item = [self myCustomBackButton_backBarbuttonItem];
    if (item) {
        return item;
    }
    item = objc_getAssociatedObject(self, &kCustomBackButtonKey);
    if (!item) {
        item = [[self class] customGlobalBackBarButtonItem];
        objc_setAssociatedObject(self, &kCustomBackButtonKey, item, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return item;
}

+ (UIBarButtonItem *)customGlobalBackBarButtonItem {
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:NULL];
    return item;
}

- (void)dealloc
{
    objc_removeAssociatedObjects(self);
}

@end
