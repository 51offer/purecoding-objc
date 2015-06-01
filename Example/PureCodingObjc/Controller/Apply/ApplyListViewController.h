//
//  ApplyListViewController.h
//  51offer
//
//  Created by 51offer on 15/3/30.
//  Copyright (c) 2015年 51offer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ApplyListViewController : UIViewController
{
    BOOL _isMoreData;
    SEL _selector;
}

// { UI一类 }
@property (weak, nonatomic) IBOutlet UITableView          *tableView;
@property (weak, nonatomic) IBOutlet UIImageView          *emptyImageV;
@property (weak, nonatomic) IBOutlet UILabel              *emptyLabel;
@property (weak, nonatomic) IBOutlet UIView               *headerView;
@property (weak, nonatomic) IBOutlet UILabel              *headerLabel;

// { 数据一类 }
@property (strong, nonatomic) NSMutableArray              *dataArray;
// 申请类型：1-未申请  2-已发申请 { 注释另起一行 }
@property (nonatomic        ) NSInteger                   applyType;



// {代理协议方法等一类，方法用法及参数说明写好}

/**
 *  只是tableView的一个datasource方法
 *
 *  @param tableView 被代理对象
 *  @param indexPath 路径
 *
 *  @return cell行高返回
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section;
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section;

// {公共方法一类}
- (void)viewWillAppear:(BOOL)animated;
- (void)viewDidLayoutSubviews;
- (void)dealloc;

@end
