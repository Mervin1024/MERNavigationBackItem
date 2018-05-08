//
//  UINavigationItem+MERBackBarButtonItem.m
//  MERNavigationBackItem
//
//  Created by 马遥 on 2018/5/8.
//

#import "UINavigationItem+MERBackBarButtonItem.h"
#import "UINavigationBar+MERBackBarButtonItem.h"
#import <objc/runtime.h>

@implementation UINavigationItem (MERBackBarButtonItem)

+(void)load{
    if (@available(iOS 11.0, *)) {
        // iOS 11 无效
    } else {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            SEL originalSEL = @selector(backBarButtonItem);
            SEL swizzledSEL = @selector(mer_myCustomBackButton_backBarbuttonItem);
            Method originalMethod = class_getInstanceMethod(self, originalSEL);
            Method swizzledMethod = class_getInstanceMethod(self, swizzledSEL);
            
            BOOL didAddMethod = class_addMethod([self class],
                                                originalSEL,
                                                method_getImplementation(swizzledMethod),
                                                method_getTypeEncoding(swizzledMethod));
            
            if (didAddMethod) {
                class_replaceMethod([self class],
                                    swizzledSEL,
                                    method_getImplementation(originalMethod),
                                    method_getTypeEncoding(originalMethod));
            } else {
                method_exchangeImplementations(originalMethod, swizzledMethod);
            }

        });

    }
}

-(UIBarButtonItem *)mer_myCustomBackButton_backBarbuttonItem{
    UIBarButtonItem *item = [self mer_myCustomBackButton_backBarbuttonItem];
    if (item) {
        return item;
    }
    item = [UINavigationBar appearance].mer_globalBackBarButtonItem;
    if (!item) {
        NSString *title = [UINavigationBar appearance].mer_globalBackBarButtonTitle;
        item = [[UIBarButtonItem alloc] initWithTitle:title?:@"返回" style:UIBarButtonItemStylePlain target:nil action:NULL];
        [UINavigationBar appearance].mer_globalBackBarButtonItem = item;
    }
    return item;
}

@end
