//
//  UINavigationBar+MERBackBarButtonItem.h
//  MERNavigationBackItem
//
//  Created by 马遥 on 2018/5/8.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (MERBackBarButtonItem)

/**
 返回按钮标题设置，推荐使用 UI_APPEARANCE_SELECTOR 来进行设置
 默认为 "返回" , 可以通过 [UINavigationBar appearance].mer_globalBackBarButtonTitle 重设默认返回标题
 */
@property (nonatomic, copy) NSString *mer_globalBackBarButtonTitle UI_APPEARANCE_SELECTOR;
/**
 返回按钮设置，默认为 nil。
 当此属性不为 nil 时， mer_globalBackBarButtonTitle 的值将被忽略。
 */
@property (nonatomic, strong) UIBarButtonItem *mer_globalBackBarButtonItem UI_APPEARANCE_SELECTOR;

@end
