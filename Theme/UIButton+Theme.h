//
//  UIButton+Theme.h
//  Theme
//
//  Created by huxiaoyang on 2019/11/11.
//  Copyright © 2019 hy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KSSkinModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Theme)

- (void)hy_setBackgroudColorThemeKey:(KSSkinKey)key;

- (void)hy_setTitleColorThemeKey:(KSSkinKey)key forState:(UIControlState)state;

@end

NS_ASSUME_NONNULL_END
