//
//  TitleLinkModel.m
//  JAVBus
//
//  Created by mgfjx on 2018/12/27.
//  Copyright © 2018 mgfjx. All rights reserved.
//

#import "TitleLinkModel.h"

@implementation TitleLinkModel

- (NSString *)title {
    if (!_title) {
        _title = @"";
    }
    return _title;
}

@end
