//
//  UILabel+Theme.m
//  Theme
//
//  Created by huxiaoyang on 2019/11/11.
//  Copyright © 2019 hy. All rights reserved.
//

#import "UILabel+Theme.h"
#import "UIColor+Theme.h"
#import "KSSkinManager.h"

@implementation UILabel (Theme)

 - (void)hy_setTextColorThemeKey:(KSSkinKey)key {
    self.textColor = [skin_style_model() colorWithKey:key];
    
    #define WS(weakSelf) __weak __typeof(&*self)weakSelf = self;
    WS(weakSelf)
    skin_register_observer(self, _cmd, ^{
        [weakSelf hy_setTextColorThemeKey:key];
    });
}

- (void)hy_setBackgroudColorThemeKey:(KSSkinKey)key {
    self.backgroundColor = [skin_style_model() colorWithKey:key];
    
    #define WS(weakSelf) __weak __typeof(&*self)weakSelf = self;
    WS(weakSelf)
    skin_register_observer(self, _cmd, ^{
        [weakSelf hy_setBackgroudColorThemeKey:key];
    });
}

@end
