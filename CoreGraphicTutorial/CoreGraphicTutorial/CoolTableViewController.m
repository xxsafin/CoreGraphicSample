//
//  CoolTableViewController.m
//  CoreGraphicTutorial
//
//  Created by Xu Xian on 14-3-31.
//  Copyright (c) 2014年 Xu Xian. All rights reserved.
//

#import "CoolTableViewController.h"

#import "CustomCellBackground.h"
#import "CustomHeader.h"
#import "CustomFooter.h"

@interface CoolTableViewController ()

@end

@implementation CoolTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Core Graphics 101";
    self.thingsToLearn = [@[@"Drawing Rects", @"Drawing Gradients", @"Drawing Arcs"] mutableCopy];
    self.thingsLearned = [@[@"Table Views", @"UIKit", @"Objective-C"] mutableCopy];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0 )
    {
        return _thingsLearned.count;
    }
    else
    {
        return  _thingsToLearn.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CoolCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if(![cell.backgroundView isKindOfClass:[CustomCellBackground class]])
    {
        CustomCellBackground *selectedBGCell = [[CustomCellBackground alloc] init];
        selectedBGCell.selected = NO;
        cell.backgroundView = selectedBGCell;
    }
    
    if(![cell.selectedBackgroundView isKindOfClass:[CustomCellBackground class]])
    {
       CustomCellBackground *selectedBGCell = [[CustomCellBackground alloc] init];
        selectedBGCell.selected = YES;
        cell.selectedBackgroundView = selectedBGCell;
    }
    
    NSString *entry;
    
    if (indexPath.section == 0)
    {
        entry = self.thingsToLearn[indexPath.row];
        ((CustomCellBackground *)cell.backgroundView).lastCell = (indexPath.row == self.thingsToLearn.count - 1);
        ((CustomCellBackground *)cell.selectedBackgroundView).lastCell = (indexPath.row == self.thingsToLearn.count - 1);
    }
    else
    {
        entry = self.thingsLearned[indexPath.row];
        ((CustomCellBackground *)cell.backgroundView).lastCell = (indexPath.row == self.thingsLearned.count - 1);
        ((CustomCellBackground *)cell.selectedBackgroundView).lastCell = (indexPath.row == self.thingsLearned.count - 1);
    }
    
    cell.textLabel.text = entry;
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.textLabel.highlightedTextColor = [UIColor clearColor];

    
    
//    cell.contentView.backgroundColor = [UIColor clearColor];
//    tableView.backgroundColor = [UIColor clearColor];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section == 0)
    {
        return @"Things We'll learn";
    }
    else
    {
        return @"Things Already Learned";
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
//    
//    if(cell.selected)
//    {
//        [cell setSelected:NO];
//        [(CustomCellBackground *)cell.selectedBackgroundView setSelected:NO];
//        [(CustomCellBackground *)cell.selectedBackgroundView setNeedsDisplay];
//    }
//    else
//    {
//        [cell setSelected:YES];
//        [(CustomCellBackground *)cell.selectedBackgroundView setSelected:YES];
//        [(CustomCellBackground *)cell.selectedBackgroundView setNeedsDisplay];
//    }
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    CustomHeader *header = [[CustomHeader alloc] init];
    header.titleLabel.text = [self tableView:tableView titleForHeaderInSection:section];
    
    if(section == 1)
    {
        header.lightColor = [UIColor colorWithRed:147.0/255.0 green:105.0/255.0 blue:216.0/255.0 alpha:1.0];
        header.darkColor = [UIColor colorWithRed:72.0/255.0 green:22.0/255.0 blue:137.0/255.0 alpha:1.0];
    }
    
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50.f;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    CustomFooter *footer = [[CustomFooter alloc] init];
    
    return footer;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 15.f;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
