//
//  GlobalUtils.h
//  MyTest
//
//  Created by CaiLei on 12/8/14.
//  Copyright (c) 2014 leso. All rights reserved.
//

#import <Foundation/Foundation.h> 

@interface GlobalUtils : NSObject
+ (void)setupCore;
+ (void)clearCore;

//+ (void)deliverSelector:(SEL)selector fromObject:(id)fromObj toObject:(id)toObj;
@end

#ifdef __cplusplus
extern "C" {
#endif
    BOOL isEmpty(id aItem);
    void Swizzle(Class c, SEL orig, SEL newField);
#ifdef __cplusplus
}
#endif
