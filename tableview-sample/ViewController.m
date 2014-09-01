//
//  ViewController.m
//  tableview-sample
//
//  Created by suzuki_kiwamu on 9/1/14.
//  Copyright (c) 2014 suzuki_kiwamu. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *mytable;
/**
テーブルに表示する情報が入ります。
*/
@property (nonatomic, strong) NSArray *dataSource;




@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // デリゲートメソッドをこのクラスで実装する
    self.mytable.delegate = self;
    self.mytable.dataSource = self;
    
    // テーブルに表示したいデータソースをセット
    self.dataSource = @[@"data1",
                        @"data2",
                        @"data3",
                        @"data4",
                        @"data5",
                        @"data6",
                        @"data7",
                        @"data8",
                        @"data9",
                        @"data10",
                        @"data11",
                        @"data12",
                        @"data13",
                        @"data14",
                        @"data15",
                        @"data16",
                        @"data17",
                        @"data18",
                        @"data19",
                        @"data20",
                        @"data21",
                        ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableView DataSource

/**
 テーブルに表示するデータ件数を返します。（必須）
 
 @return NSInteger : データ件数
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger dataCount;
    
    dataCount = self.dataSource.count;
    
    return dataCount;
}

/**
 テーブルに表示するセクション（区切り）の件数を返します。（オプション）
 
 @return NSInteger : セクションの数
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
/**
 テーブルに表示するセルを返します。（必須）
 
 @return UITableViewCell : テーブルセル
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    // 再利用できるセルがあれば再利用する
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        // 再利用できない場合は新規で作成
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text         = self.dataSource[indexPath.row];
    cell.backgroundColor        = [UIColor blackColor];
    cell.textLabel.textColor    = [UIColor redColor];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // 削除するコードを挿入します
    }
}
/**
 * セルが選択されたとき
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"選択されました");
    //遷移先ViewControllerクラスのインスタンス生成
    //ViewController2 *testVC2 = [self.storyboard instantiateViewControllerWithIdentifier:@"testVC2"];
    //[self presentModalViewController:testVC2 animated:YES ];
    
    ViewController2 *testVC2 = [self.storyboard instantiateViewControllerWithIdentifier:@"testVC2"];
    [self presentViewController:testVC2 animated:YES completion: nil];
    
}
@end
