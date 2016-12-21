//
//  TableViewController.m
//  Intern_CS117
//
//  Created by Shashank Khanna  on 10/11/16.
//  Copyright © 2016 CS117. All rights reserved.
//

#import "TableViewController.h"
#import "DetailViewController.h"
@interface TableViewController ()

@end

@implementation TableViewController{
    NSArray *names;
    NSMutableData *data;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    NSURL *url  = [NSURL URLWithString:@"https://data.lacity.org/resource/ngkp-kqkn.json?city=BEVERLY%20HILLS"];// council_district=13
    // https://data.seattle.gov/resource/4ced-9xze.json
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [[NSURLConnection alloc] initWithRequest:request delegate:self];
   // names = [NSArray arrayWithObjects:@"One", @"Two" , nil];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)connection:(NSURLConnection *)connection
didReceiveResponse:(NSURLResponse *)response{
    data = [[NSMutableData alloc] init] ; 
    
}

- (void)connection:(NSURLConnection *)connection
    didReceiveData:(NSData *)theData{
    [data appendData:theData];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    // this is where we do the json parsing
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO; 
    names = [NSJSONSerialization JSONObjectWithData:data
                                            options:nil
                                              error:nil];
    [self.tableView reloadData];
}
- (void)connection:(NSURLConnection *)connection
  didFailWithError:(NSError *)error{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                   message:@"The download could not complete."
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Dismiss" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO; 

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [names count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *tableIdentifier = @"MainCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: tableIdentifier];
    
    if (cell == nil)
    {
    cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier:tableIdentifier];
    }
    
    cell.textLabel.text = [[names objectAtIndex:indexPath.row] objectForKey:@"business_name"]; 
    // organization
    cell.detailTextLabel.text = [[names objectAtIndex:indexPath.row] objectForKey:@"city"]; 
    // business_district
    // Configure the cell...
    
    return cell;
}

////
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    [self.navigationController pushViewController:detailViewController animated:YES];
//}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
//    if ([segue.identifier isEqualToString:@"bizDetail"]){
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    DetailViewController *detailViewController = segue.destinationViewController;
    detailViewController.title = [[names objectAtIndex:indexPath.row] objectForKey:@"business_name"]; // organization
    detailViewController.displayStuff = [names objectAtIndex:indexPath.row];
    
    //}
    
}


@end
