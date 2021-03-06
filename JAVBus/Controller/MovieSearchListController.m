//
//  MovieSearchListController.m
//  JAVBus
//
//  Created by mgfjx on 2018/12/30.
//  Copyright © 2018 mgfjx. All rights reserved.
//

#import "MovieSearchListController.h"

@interface MovieSearchListController ()

@end

@implementation MovieSearchListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)requestData:(BOOL)refresh {
    
    if (refresh) {
        self.page = 1;
    }else{
        self.page ++;
    }
    
    NSString *url = self.url;
    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [HTMLTOJSONMANAGER parseSearchListByUrl:url page:self.page callback:^(NSArray *array) {
        [self.collectionView stopHeaderRefreshing];
        [self.collectionView stopFooterRefreshing];
        
        if (array.count == 0) {
            return ;
        }
        
        NSMutableArray *arr ;
        if (refresh) {
            arr = [NSMutableArray array];
        }else{
            arr = [NSMutableArray arrayWithArray:self.dataArray];
        }
        [arr addObjectsFromArray:array];
        self.dataArray = [arr copy];
        [self.collectionView reloadData];
    }];
}

@end
