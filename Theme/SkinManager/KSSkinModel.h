//
//  KSSkinModel.h
//  gif
//
//  Created by huxiaoyang on 2019/11/7.
//  Copyright © 2019 kuaishou. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, KSSkinKey) {
    skin_label_text_color,
    skin_label_backgroud_color,
    skin_button_backgroud_color,
    skin_button_title_color,
};

NS_ASSUME_NONNULL_BEGIN

@interface KSSkinModel : NSObject

- (UIColor *)colorWithKey:(KSSkinKey)key;

@end

NS_ASSUME_NONNULL_END
