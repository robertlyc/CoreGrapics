//
//  ViewController.m
//  CoreGraphics
//
//  Created by RoBeRt on 13-1-16.
//  Copyright (c) 2013年 RoBeRt. All rights reserved.
//

#import "TableViewController.h"
#import "CustomCellBackground.h"
#import "CustomHeader.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = @"Core Graphics 101";
    thingsToLearn = [NSMutableArray arrayWithObjects:@"Drawing Rects",
                          @"Drawing Gradients", @"Drawing Arcs", nil];
    thingsLearned = [NSMutableArray arrayWithObjects:@"Table Views",
                          @"UIKit", @"Objective-C", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return thingsToLearn.count;
    } else {
        return thingsLearned.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.backgroundView = [[CustomCellBackground alloc] init];
        cell.selectedBackgroundView = [[CustomCellBackground alloc] init];
    }
    //configure cell
    if (indexPath.row == 0) {
        cell.textLabel.text = [thingsToLearn objectAtIndex:indexPath.row];
    } else {
        cell.textLabel.text = [thingsLearned objectAtIndex:indexPath.row];
    }
    
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"Things We'll Learn";
    } else {
        return @"Things Already Covered";
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    CustomHeader *header = [[CustomHeader alloc] init];
    header.titleLabel.text = [self tableView:tableView titleForHeaderInSection:section];
    return header;
}   

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}

- (void)viewDidUnload {
    thingsLearned = nil;
    thingsToLearn = nil;
}

@end
