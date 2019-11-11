//
//  UIButton+Theme.m
//  Theme
//
//  Created by huxiaoyang on 2019/11/11.
//  Copyright © 2019 hy. All rights reserved.
//

#import "UIButton+Theme.h"
#import "KSSkinManager.h"
#import "UIColor+Theme.h"

@implementation UIButton (Theme)

- (void)bt_setThemeTextColor{

    self.backgroundColor = skin_style_model().buttonColor;
    
    __weak __typeof(&*self)weakSelf = self;
    KSSwitchSkinBlock switchThemeBlock = ^{
        [weakSelf bt_setThemeTextColor];
    };

    skin_register_observer(self, @selector(bt_setThemeTextColor), switchThemeBlock);
}

@end
