//
//  ViewController.m
//  GroupedTable
//
//  Copyright (c) 2013 Johnnie Walker
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

#import "ViewController.h"
#import "GroupedTableViewCell.h"

@interface ViewController ()

@end

NSString * const CellReuseIdentifier = @"CellReuseIdentifier";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[GroupedTableViewCell class] forCellReuseIdentifier:CellReuseIdentifier];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return section + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GroupedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellReuseIdentifier];
    
	NSInteger rows = [self tableView:tableView numberOfRowsInSection:indexPath.section];
	
	if (indexPath.row == 0 && rows == 1) {
		cell.position = GroupedTableViewCellPositionFull;
	}
    
	if (indexPath.row == 0 && rows > 1) {
		cell.position = GroupedTableViewCellPositionTop;
	}
    
	if (indexPath.row > 0 && rows > 1) {
		cell.position = GroupedTableViewCellPositionMiddle;
	}
    
	if (indexPath.row == (rows -1) && rows > 1) {
		cell.position = GroupedTableViewCellPositionBottom;
	}	
    
    
    cell.textLabel.text = [NSString stringWithFormat:@"Section %i, Row %i", indexPath.section, indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

@end
