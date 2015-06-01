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
    
    // block写法1
    void(^_didClick)(BOOL isSelected, id object);
    void(^_didSuccess)();
}

// block写法2
@property (nonatomic, copy) void(^didTap)(BOOL isSelected);


@end

@implementation ApplyListViewController


#pragma mark - class methods




#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];

    self.automaticallyAdjustsScrollViewInsets = YES;
    
    // {if，else写法}
    if (self.applyType == 1) {
         self.navigationItem.title = @"未发出的申请";
    }
    else if (self.applyType == 2){
         self.navigationItem.title = @"已发出的申请";
    }
    else {
        self.navigationItem.title = @"我的offer";
    }
    
    _dataArray = [[NSMutableArray alloc] initWithCapacity:0];
    BOOL _isSelected;
    
    __weak ApplyListViewController *weakSelf = self;
    __weak typeof(self) weakSlef = self;
    
    // {多种共存属性或者很长的或语句写法，对齐}
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin
    | UIViewAutoresizingFlexibleRightMargin
    | UIViewAutoresizingFlexibleTopMargin
    | UIViewAutoresizingFlexibleBottomMargin;
    
    UITableViewCell *cell;
    cell.accessoryType = _isSelected ? UITableViewCellAccessoryNone
                                     : UITableViewCellAccessoryDisclosureIndicator;

    // {block 判断并implement写法}
    !_didTap ?: _didTap(_isSelected);
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
    return nil;
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
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
        }
        else if(_applyType == 2)
        {
            _emptyImageV.image = [UIImage imageNamed:@"image_offer_no_send"];
            _emptyLabel.text = @"你目前还没有已发出的申请";
        }
        else
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


#pragma mark - getters & setters



@end
