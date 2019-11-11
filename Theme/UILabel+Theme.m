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

- (void)bl_setThemeTextColor{
    
    self.backgroundColor = skin_style_model().labelColor;
    self.textColor = [UIColor whiteColor];
    
    #define WS(weakSelf) __weak __typeof(&*self)weakSelf = self;
    WS(weakSelf)
    skin_register_observer(self, _cmd, ^{
        [weakSelf bl_setThemeTextColor];
    });
}

@end
