//
//  KSSkinManager.m
//  gif
//
//  Created by huxiaoyang on 2019/11/7.
//  Copyright © 2019 kuaishou. All rights reserved.
//

#import "KSSkinManager.h"
#import "KSSkinWrapper.h"

@interface KSSkinManager ()

@property (nonatomic, strong) NSMutableDictionary<KSSkinWrapper *, id> *blockDictionary;
@property (nonatomic, strong) KSSkinModel *skinModel;
@property (nonatomic, assign) KSSkinStyle skinStyle;

@end


@implementation KSSkinManager

#pragma mark - public methods

KSSkinManager *skin_manager() {
    return [KSSkinManager shared];
}

KSSkinModel *skin_style_model() {
    return [KSSkinManager shared].skinModel;
}

KSSkinStyle skin_style() {
    return [KSSkinManager shared].skinStyle;
}

void skin_register_observer(id target, SEL selector, KSSwitchSkinBlock block) {
    KSSkinWrapper *wrapper = [[KSSkinWrapper alloc] initWithTarget:target selctorName:NSStringFromSelector(selector)];
    KSSkinManager *manager = [KSSkinManager shared];
    if (block) {
        NSArray *allKeys = [manager.blockDictionary allKeys];
        if (![allKeys containsObject:wrapper]) {
            [manager.blockDictionary setObject:block forKey:wrapper];
        }
    }
}

void skin_switch(KSSkinStyle style) {
    [[KSSkinManager shared] switchSkinStyle:style];
    KSSkinManager *manager = [KSSkinManager shared];
    for (KSSkinWrapper *key in [manager.blockDictionary allKeys]) {
        id object = key.target;
        if (object) {
            if ([object respondsToSelector:NSSelectorFromString(key.selectorName)]) {
                KSSwitchSkinBlock block = manager.blockDictionary[key];
                if (block) {
                    block();
                }
            }
        } else {
            [manager.blockDictionary removeObjectForKey:key];
        }
    }
}


#pragma mark - private methods

+ (instancetype)shared {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[KSSkinManager alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _blockDictionary = [NSMutableDictionary dictionary];
        KSSkinStyle style = KSSkinStyleDefault;
        [self switchSkinStyle:style];
    }
    return self;
}

- (void)switchSkinStyle:(KSSkinStyle)style {
    _skinStyle = style;
    if (style == KSSkinStyleTheme1) {
        _skinModel = [KSSkinModel theme1SkinModel];
    } else {
        _skinModel = [KSSkinModel defaultSkinModel];
    }
}

@end
