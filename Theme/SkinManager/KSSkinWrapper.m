//
//  KSSkinWrapper.m
//  gif
//
//  Created by huxiaoyang on 2019/11/7.
//  Copyright © 2019 kuaishou. All rights reserved.
//

#import "KSSkinWrapper.h"

@interface KSSkinWrapper ()

@property(nonatomic, copy) NSString *pointerString;
@property(nonatomic, copy) NSString *targetTypeName;

@end


@implementation KSSkinWrapper

- (instancetype)initWithTarget:(id)target selctorName:(NSString *)selectorName {
    if (self = [super init]) {
        _target = target;
        _selectorName = selectorName;
        _pointerString = [NSString stringWithFormat:@"%p", target];
        _targetTypeName = NSStringFromClass([target class]);
    }
    return self;
}

- (BOOL)isEqual:(id)object {
    KSSkinWrapper *wrapper = (KSSkinWrapper *)object;
    if (wrapper) {
        if([self.pointerString isEqualToString:wrapper.pointerString] &&
           [self.selectorName isEqualToString:wrapper.selectorName] &&
           [self.targetTypeName isEqualToString:wrapper.targetTypeName]){
            return YES;
        }
    }
    return NO;
}

- (NSUInteger)hash {
    NSUInteger hash = [self.pointerString hash] ^ [self.selectorName hash] ^ [self.targetTypeName hash];
    return hash;
}

- (id)copyWithZone:(NSZone *)zone {
    KSSkinWrapper *wrapper = [[KSSkinWrapper allocWithZone:zone] initWithTarget:self.target selctorName:self.selectorName];
    return wrapper;
}

@end
