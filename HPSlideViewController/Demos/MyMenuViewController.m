//
//  MyMeunViewController.m
//  HPSlideViewController
//
//  Created by Hu, Peng on 11/26/15.
//  Copyright © 2015 Hu, Peng. All rights reserved.
//

#import "MyMenuViewController.h"

@interface MyMenuViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MyMenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - UITableViewDataSource and UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"menuItem"];
    cell.textLabel.text = [@"Menu Item - " stringByAppendingString:@(indexPath.row).stringValue];
    cell.textLabel.textColor = [UIColor redColor];
    return cell;
}

@end
