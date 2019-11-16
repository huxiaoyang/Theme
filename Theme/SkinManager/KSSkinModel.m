//
//  KSSkinModel.m
//  gif
//
//  Created by huxiaoyang on 2019/11/7.
//  Copyright © 2019 kuaishou. All rights reserved.
//

#import "KSSkinModel.h"
#import "UIColor+Theme.h"
#import "KSSkinManager.h"

@implementation KSSkinModel

- (NSDictionary *)styleDictionary {
    NSURL *bundleURL = [[NSBundle mainBundle] URLForResource:@"skin" withExtension:@"bundle"];
    if (!bundleURL) {
        return nil;
    }
    NSURL *styleJson = [bundleURL URLByAppendingPathComponent:@"style.json" isDirectory:NO];
    if (!styleJson) {
        return nil;
    }
    NSError *error = nil;
    NSData *data = [NSData dataWithContentsOfURL:styleJson options:0 error:&error];
    NSDictionary *dictionary = nil;
    if (data && !error) {
        dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
    }
    return dictionary;
}

NSString *StringWithSkinKey(KSSkinKey key) {
    switch (key) {
        case skin_label_text_color:
            return @"label_text_color";
        case skin_label_backgroud_color:
            return @"label_backgroud_color";
         case skin_button_backgroud_color:
            return @"button_backgroud_color";
        case skin_button_title_color:
            return @"button_title_color";
    }
}

- (UIColor *)colorWithKey:(KSSkinKey)key {
    if (skin_style() == KSSkinStyleTheme1) {
        NSString *colorString = [[self styleDictionary] valueForKey:StringWithSkinKey(key)];
        return [UIColor colorWithHexString:colorString];
    }
    
    /// 这里先随便一个默认值，正常需要一个默认皮肤的 json
    return [UIColor orangeColor];
}

@end
