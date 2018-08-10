//
//  ViewController.m
//  TableViewInsertWebView
//
//  Created by zhangyan on 2017/6/28.
//  Copyright © 2017年 zhangyan. All rights reserved.
//

#import "ViewController.h"
#import "MyTableViewCell.h"
#import "WebModel.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *myTableView;
@property (nonatomic,strong)NSMutableArray *dataSource;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self createUI];
    [self createData];
    [self manageNoti];
    
}

// 加载界面
- (void)createUI
{
    [self.view addSubview:self.myTableView];
}

// 更新数据源
- (void)createData
{
    
    for (NSInteger i = 0; i < 3; i++) {
        WebModel *model = [[WebModel alloc] init];
        model.webStr = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%ld",i] ofType:@"html"];
        [self.dataSource addObject:model];
    }
    
    [self.myTableView reloadData];
}

// 获取通知
- (void)manageNoti
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshCell:) name:@"RefreshCell" object:nil];
}

// 通知方法，刷新tableView
- (void)refreshCell:(NSNotification *)notifaication
{
    [self.myTableView reloadData];
}


#pragma mark- UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyTableViewCell" forIndexPath:indexPath];
    WebModel *model = self.dataSource[indexPath.row];
    cell.model = model;
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WebModel *model = self.dataSource[indexPath.row];
    return model.webViewHeight;
}



#pragma mark- set
- (UITableView *)myTableView
{
    if (!_myTableView) {
        _myTableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        [_myTableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"MyTableViewCell"];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
    }
    return _myTableView;
}

- (NSMutableArray *)dataSource
{
    if (_dataSource == nil) {
        _dataSource = [[NSMutableArray alloc] init];
    }
    return _dataSource;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
