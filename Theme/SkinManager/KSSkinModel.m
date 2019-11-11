//
//  KSSkinModel.m
//  gif
//
//  Created by huxiaoyang on 2019/11/7.
//  Copyright © 2019 kuaishou. All rights reserved.
//

#import "KSSkinModel.h"
#import "UIColor+Theme.h"


@implementation KSSkinModel

+ (instancetype)defaultSkinModel {
    return [[KSSkinModel alloc] initWithThemeSkin:NO];
}

+ (instancetype)theme1SkinModel {
    return [[KSSkinModel alloc] initWithThemeSkin:YES];
}

- (instancetype)initWithThemeSkin:(BOOL)useSkin {
    self = [super init];
    if (self) {
        if (useSkin) {
            [self theme1SkinConfig];
        } else {
            [self defaultSkinConfig];
        }
    }
    return self;
}

- (void)defaultSkinConfig {
    _labelColor = [UIColor colorWithHexString:@"#222222"];
    _buttonColor = [UIColor colorWithHexString:@"#E0E0E0"];
}

- (void)theme1SkinConfig {
    NSDictionary *dictionary = [self styleDictionary];
    if (!dictionary) {
        return;
    }
    _labelColor = [UIColor colorWithHexString:dictionary[@"label_color"]];
    _buttonColor = [UIColor colorWithHexString:dictionary[@"button_color"]];
}

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

@end
