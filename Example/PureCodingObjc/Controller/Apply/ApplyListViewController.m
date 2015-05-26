//
//  ApplyListViewController.m
//  51offer
//
//  Created by 51offer on 15/3/30.
//  Copyright (c) 2015年 51offer. All rights reserved.
//
// {『{}』内是对代码风格的注释}

#import "ApplyListViewController.h"


#define WIDTH   [[UIScreen mainScreen] bounds].size.width

@interface ApplyListViewController ()<UITableViewDataSource, UITableViewDelegate>
{

    NSMutableArray * _dataArray;
    CGFloat _heightForCell;
}

@end

@implementation ApplyListViewController


#pragma mark - class methods




#pragma mark - life cycle

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
//    [_tableView triggerPullToRefresh];
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.tableView.backgroundColor = rgb(242.00, 242.00, 245.00);
    self.automaticallyAdjustsScrollViewInsets = YES;
    
    if (self.applyType == 1) {
         self.navigationItem.title = @"未发出的申请";
    } else if (self.applyType == 2){
         self.navigationItem.title = @"已发出的申请";
    } else
         self.navigationItem.title = @"我的offer";
    
//    _user = [[OFStore sharedInstance] defaultsLoadObjectWithKey:kDefaultsCurrentUser];
    _dataArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    // 支付成功通知刷新申请列表
    
//    [_tableView registerClass:[ApplyBaseCell class] forCellReuseIdentifier:kCellIDApplyBase];
//    [_tableView registerClass:[ApplyUrgeCell class] forCellReuseIdentifier:kCellIDApplyUrge];
//    [_tableView registerClass:[ApplyInterviewCell class] forCellReuseIdentifier:kCellIDApplyInterview];
//    [_tableView registerClass:[ApplyEnrolCell class] forCellReuseIdentifier:kCellIDApplyEnrol];
//    [_tableView registerClass:[ApplyPayCell class] forCellReuseIdentifier:kCellIDApplyPay];
//    [_tableView registerClass:[ApplyOfferCell class] forCellReuseIdentifier:kCellIDApplyOffer];
//    [_tableView registerClass:[ApplyOutdateEightCell class] forCellReuseIdentifier:kCellIDApplyOutdateEight];
    
    __weak ApplyListViewController *weakSelf = self;
//    [[NSNotificationCenter defaultCenter] addObserverForName:kNotifPaySuccess object:nil queue:nil usingBlock:^(NSNotification *note) {
//        [weakSelf getApplyList];
//    }];
    
    // setup pull-to-refresh
//    [self.tableView addPullToRefreshWithActionHandler:^{
//        // 获取申请列表
//        [weakSelf getApplyList];
//    }];
    
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    ApplyBaseCell * cell= [self createCellWithIndexPathRow:indexPath.row];
//    cell.delegate = self;
//    return cell;
    return nil;
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // UP: cell 高度计算待优化
//    ApplyBaseCell * cell = [self createCellWithIndexPathRow:indexPath.row];
//    cell.delegate = self;
//    return cell.cellHeight;
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *abroadStoryboard = [UIStoryboard storyboardWithName:@"Abroad" bundle:nil];
    UIViewController *vc = ((UIViewController *)[abroadStoryboard instantiateViewControllerWithIdentifier:@"workflow"]);
//    ((WorkflowViewController *)vc).applyModel = (ApplyModel *)[_dataArray objectAtIndex:indexPath.row];
//    [self.navigationController pushViewController:((WorkflowViewController *)vc) animated:YES];
}


#pragma mark - ApplyDelegate




#pragma mark - event response




#pragma mark - private methods

- (void) resetTableviewWithData
{
    if (_dataArray.count == 0) {
        CGRect frame = [[UIScreen mainScreen] bounds];
        frame.size.height -= 64;
        _headerView.frame = frame;
        if (_applyType == 1)
        {
            _emptyImageV.image = [UIImage imageNamed:@"image_offer_no_unsend"];
            _emptyLabel.text = @"你目前还没有未发出的申请，先去选择学校吧";
        }else if(_applyType == 2)
        {
            _emptyImageV.image = [UIImage imageNamed:@"image_offer_no_send"];
            _emptyLabel.text = @"你目前还没有已发出的申请";
        }else
        {
            _emptyImageV.image = [UIImage imageNamed:@"image_offer_no_my"];
            _emptyLabel.text = @"你目前还没有获得任何offer";
        }
    }
    else
    {
        _headerView.frame = CGRectMake(0, 0, self.view.frame.size.width, 20);
        if (self.applyType == 2) {
            _headerLabel.text = @"学校发offer的时间一般为4~8周哦，请耐心等待吧";
        }
        else if (self.applyType == 3){
            _headerLabel.text = @"恭喜你拿到offer，决定好要去哪所学校了吗？";
        }
    }
    
    [_tableView reloadData];
}

- (void)getApplyList{
    __weak ApplyListViewController *weakSelf = self;
    
//    [[ApplyProvider sharedInstance] applyListWithUid:_user.userID
//                                                type:@(self.applyType).description
//                                                salt:_user.salt
//                                        successBlock:^(NSMutableArray *applyModelarr, NSString *msg)
//     {
//         [_tableView.pullToRefreshView stopAnimating];
//         _dataArray = applyModelarr;
//         [weakSelf resetTableviewWithData];
//     }
//                                           failBlack:^(AFHTTPRequestOperation *operation, NSError *err)
//     {
//         [_tableView.pullToRefreshView stopAnimating];
//         _emptyImageV.image = [UIImage imageNamed:@"image_bad_network"];
//         _emptyLabel.text = @"网络漫游到外太空去啦~";
//     }];
}

//- (ApplyBaseCell *)createCellWithIndexPathRow:(NSInteger)row
//{
//    NSString * cellID = kCellIDApplyBase;
//    ApplyModel * model = [_dataArray objectAtIndex:row];
//    
//    if (_applyType == 1 && model.isNeedUrge == YES) { // 催一下
//        cellID = kCellIDApplyUrge;
//    } else if (model.paytype.intValue == 1 || model.paytype.intValue == 2 ) {// 1-未支付 2-已经支付
//        cellID = kCellIDApplyPay;
//    }else if (model.paytype.intValue == 9 || model.isOutEightDaysDate == YES ) {// 过期八周无反馈
//        cellID = kCellIDApplyOutdateEight;
//    } else if (model.workflowID == 10 && model.isOutDated == NO){ // 是否接受面试
//        cellID = kCellIDApplyInterview;
//    } else if ((model.workflowID == 11 || model.workflowID == 12) && model.isOutDated == NO)
//    { // 还有多少时间 （处理有条件offer / 提交补充材料）
//        cellID = kCellIDApplyOffer;
//    }else if (model.workflowID == 13 && model.isOutDated == NO){ // 是否接受入学 & 没有过期
//        cellID = kCellIDApplyEnrol;
//    }
//    
//    ApplyBaseCell * cell= [self.tableView dequeueReusableCellWithIdentifier:cellID];
//    [cell setValueForCellWithApplyModel:model];
//    return cell;
//}



//-(void)applyActionWithActionType:(NSUInteger)actionType andApplyModel:(ApplyModel *)apply
//{
//    __weak ApplyListViewController *weakself = self;
//    switch (actionType)
//    {
//        case ApplyActionTypeForUrge:
//        {
//            [OFProgressHUD showWithStatus:@"努力加载中..." maskType:SVProgressHUDMaskTypeBlack];
//            // 催一下
//            [[ApplyProvider sharedInstance] remindWithOrderID:apply.sid
//                                                 successBlock:^(BOOL sucess, NSString *message)
//             {
//                 [OFProgressHUD dismiss];
//                 UIAlertView * alert = [UIAlertView bk_alertViewWithTitle:@"温馨提示" message:@"放心，我们拿着鞭子去催申请顾问啦"];
//                 [alert bk_addButtonWithTitle:@"确定" handler:^{
//                     [weakself getApplyList];
//                 }];
//                 [alert show];
//                 
//             }
//                                                    failBlack:^(AFHTTPRequestOperation *operation, OFError *err)
//             {
//                 [OFProgressHUD showErrorWithStatus:err.message];
//             }];
//            break;
//        }
//        case ApplyActionTypeForPay:
//        {
//            
//            
//            // 去支付
//            UIStoryboard *aboardStoryboard = [UIStoryboard storyboardWithName:@"Abroad" bundle:nil];
//            UIViewController * payVC = ((UIViewController *)[aboardStoryboard instantiateViewControllerWithIdentifier:@"pay"]);
//            ((PayApplyViewController *)payVC).applyModel = apply;
//            [self.navigationController pushViewController:((PayApplyViewController *)payVC) animated:YES];
//            
//            break;
//        }
//        case ApplyActionTypeForEnrol:           // 确认入学
//        case ApplyActionTypeForInterviewYES:    // 接受面试
//        case ApplyActionTypeForInterviewNO:     // 拒绝面试
//        {
//            NSString * actionTypeStr = nil;
//            
//            switch (actionType) {
//                case ApplyActionTypeForInterviewYES:
//                    actionTypeStr = @"1";
//                    break;
//                case ApplyActionTypeForEnrol:
//                    actionTypeStr = @"2";
//                    break;
//                case ApplyActionTypeForInterviewNO:
//                    actionTypeStr = @"3";
//                    break;
//            }
//            
//            [OFProgressHUD showWithStatus:@"努力加载中..." maskType:SVProgressHUDMaskTypeBlack];
//            
//            [[ApplyProvider sharedInstance] udpateWorkflowWithOrderID:apply.sid
//                                                           schoolName:apply.ename
//                                                            majorName:apply.major_name
//                                                              applyID:apply.apply_id
//                                                             workflow:apply.workflowID
//                                                           actionType:actionTypeStr
//                                                         successBlock:^(BOOL sucess)
//             {
//                 [OFProgressHUD dismiss];
//                 [weakself getApplyList];
//             }
//                                                            failBlack:^(AFHTTPRequestOperation *operation, OFError *err)
//             {
//                 [OFProgressHUD showErrorWithStatus:err.message];
//             }];
//            break;
//        }
//            
//        default:
//            break;
//    }
//    [[NSNotificationCenter defaultCenter] postNotificationName:kNotifRefreshApplyCount object:nil];
//}


#pragma mark - getters & setters



@end
