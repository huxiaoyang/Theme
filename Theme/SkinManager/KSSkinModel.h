//
//  KSSkinModel.h
//  gif
//
//  Created by huxiaoyang on 2019/11/7.
//  Copyright © 2019 kuaishou. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KSSkinModel : NSObject

@property (nonatomic, strong) UIColor *labelColor;
@property (nonatomic, strong) UIColor *buttonColor;


+ (instancetype)defaultSkinModel;
+ (instancetype)theme1SkinModel;

@end

NS_ASSUME_NONNULL_END
