//
//  UINavigationBar+MERBackBarButtonItem.m
//  MERNavigationBackItem
//
//  Created by 马遥 on 2018/5/8.
//

#import "UINavigationBar+MERBackBarButtonItem.h"
#import <objc/runtime.h>

@implementation UINavigationBar (MERBackBarButtonItem)

+ (void)load {
    if (@available(iOS 11, *)) {    // iOS 11 以下无效
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            SEL originalSEL = @selector(pushNavigationItem:animated:);
            SEL swizzledSEL = @selector(mer_customPushNavigationItem:animated:);
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

- (void)mer_customPushNavigationItem:(UINavigationItem *)item animated:(BOOL)animated {
    if (!self.topItem.backBarButtonItem) {
        UIBarButtonItem *itemBarButton = self.mer_globalBackBarButtonItem;
        [self.topItem setBackBarButtonItem:itemBarButton];
    }
    
    [self mer_customPushNavigationItem:item animated:animated];
}

#pragma mark - Property

static char MERCustomBackButtonKey;
static char MERCustomBackButtonTitleKey;

- (void)setMer_globalBackBarButtonItem:(UIBarButtonItem *)mer_globalBackBarButtonItem {
    objc_setAssociatedObject(self, &MERCustomBackButtonKey, mer_globalBackBarButtonItem, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIBarButtonItem *)mer_globalBackBarButtonItem {
    UIBarButtonItem *item = objc_getAssociatedObject(self, &MERCustomBackButtonKey);
    if (item == nil) {
        NSString *title = self.mer_globalBackBarButtonTitle;
        item = [[UIBarButtonItem alloc] initWithTitle:title?:@"返回" style:UIBarButtonItemStylePlain target:nil action:NULL];
        self.mer_globalBackBarButtonItem = item;
    }
    return item;
}

- (void)setMer_globalBackBarButtonTitle:(NSString *)mer_globalBackBarButtonTitle {
    objc_setAssociatedObject(self, &MERCustomBackButtonTitleKey, mer_globalBackBarButtonTitle, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)mer_globalBackBarButtonTitle {
    NSString *title = objc_getAssociatedObject(self, &MERCustomBackButtonTitleKey);
    return title;
}


@end
