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

- (void)hy_setBackgroudColorThemeKey:(KSSkinKey)key {
    self.backgroundColor = [skin_style_model() colorWithKey:key];
    
    #define WS(weakSelf) __weak __typeof(&*self)weakSelf = self;
    WS(weakSelf)
    skin_register_observer(self, _cmd, ^{
        [weakSelf hy_setBackgroudColorThemeKey:key];
    });
}

- (void)hy_setTitleColorThemeKey:(KSSkinKey)key forState:(UIControlState)state {
    [self setTitleColor:[skin_style_model() colorWithKey:key] forState:state];
    
    #define WS(weakSelf) __weak __typeof(&*self)weakSelf = self;
    WS(weakSelf)
    skin_register_observer(self, _cmd, ^{
        [weakSelf hy_setTitleColorThemeKey:key forState:state];
    });
}

@end
