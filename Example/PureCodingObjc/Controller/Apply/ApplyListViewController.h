//
//  ApplyListViewController.h
//  51offer
//
//  Created by 51offer on 15/3/30.
//  Copyright (c) 2015年 51offer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ApplyListViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView          *tableView;

@property (nonatomic      ) NSInteger            applyType;// 申请类型：1-未申请  2-已发申请  3-我的申请
@property (weak, nonatomic) IBOutlet UIImageView          *emptyImageV;
@property (weak, nonatomic) IBOutlet UILabel              *emptyLabel;
@property (weak, nonatomic) IBOutlet UIView               *headerView;
@property (weak, nonatomic) IBOutlet UILabel              *    headerLabel;

@end
