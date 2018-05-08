//
//  UINavigationBar+MERBackBarButtonItem.h
//  MERNavigationBackItem
//
//  Created by 马遥 on 2018/5/8.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (MERBackBarButtonItem)

@property (nonatomic, copy) NSString *mer_globalBackBarButtonTitle UI_APPEARANCE_SELECTOR;
@property (nonatomic, strong) UIBarButtonItem *mer_globalBackBarButtonItem UI_APPEARANCE_SELECTOR;

@end
