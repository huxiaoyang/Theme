//
//  KSSkinManager.h
//  gif
//
//  Created by huxiaoyang on 2019/11/7.
//  Copyright © 2019 kuaishou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KSSkinModel.h"
@class KSSkinManager;


typedef NS_ENUM(NSUInteger, KSSkinStyle) {
    KSSkinStyleDefault,
    KSSkinStyleTheme1,
};

typedef void (^KSSwitchSkinBlock)(void);


NS_ASSUME_NONNULL_BEGIN

@interface KSSkinManager : NSObject

extern KSSkinManager *skin_manager();
extern KSSkinModel *skin_style_model();
extern KSSkinStyle skin_style();

/// 注册皮肤元素
extern void skin_register_observer(id target, SEL selector, _Nullable KSSwitchSkinBlock block);

/// 切换皮肤
/// @param style 皮肤类型
extern void skin_switch(KSSkinStyle style);

@end

NS_ASSUME_NONNULL_END
