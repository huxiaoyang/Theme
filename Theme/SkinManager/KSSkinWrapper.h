//
//  KSSkinWrapper.h
//  gif
//
//  Created by huxiaoyang on 2019/11/7.
//  Copyright © 2019 kuaishou. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KSSkinWrapper : NSObject <NSCopying>

@property (nonatomic, weak, readonly) id target;
@property (nonatomic, copy, readonly) NSString *selectorName;

- (instancetype)initWithTarget:(id)target selctorName:(NSString *)selectorName;

@end

NS_ASSUME_NONNULL_END
