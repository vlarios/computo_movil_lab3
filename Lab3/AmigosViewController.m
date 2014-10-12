//
//  AmigosViewController.m
//  Lab3
//
//  Created by Victor Larios on 10/12/14.
//
//

#import "AmigosViewController.h"
#import "Declarations.h"
#import "cellFriend.h"

@interface AmigosViewController ()

@end

@implementation AmigosViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    friends     =  [NSMutableArray arrayWithObjects: @"Amiga1", @"Amiga2", @"Amiga3", @"Amiga4", @"Amiga5", @"Amigo1", @"Amigo2", @"Amigo3",  @"Amigo4", @"Amigo5",nil];
    
    friendsImg     =  [NSMutableArray arrayWithObjects: @"Amiga1.png", @"Amiga2.png", @"Amiga3.jpg", @"Amiga1.png", @"Amiga2.png", @"Amigo1.jpg", @"Amigo2.jpg", @"Amigo3.jpg",  @"Amigo1.jpg", @"Amigo2.jpg",nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**********************************************************************************************
 Table Functions
 **********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //NSLog(@"Here1");
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //NSLog(@"Here2");
    return 10;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"Here3");
    return 64;
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //NSLog(@"Here4");
    
    
    static NSString *CellIdentifier = @"cellFriend";
    
    cellFriend *cell = (cellFriend *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[cellFriend alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    //NSLog(@"Here5");
    
    cell.lblFriend.text       = friends[indexPath.row];
    cell.imgFriend.image    = [UIImage imageNamed:friendsImg[indexPath.row]];
    cell.btnShare.tag        = indexPath.row;
    [cell.btnShare addTarget:self action:@selector(shareButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
     
    return cell;
}


-(void) shareButtonPressed: (id)sender {
    
    
    NSString                    *strShareMsg;
    NSArray                     *aShareItems;
    UIImage                     *imgShare;
    UIActivityViewController    *actViewController;
    UIButton *senderButton = (UIButton *) sender;
    
    //get correct name and image of friends
    strShareMsg = friends[senderButton.tag];
    imgShare    = [UIImage imageNamed:friendsImg[senderButton.tag]];
    
    aShareItems = @[imgShare, strShareMsg];
    
    actViewController = [[UIActivityViewController alloc] initWithActivityItems:aShareItems applicationActivities:nil];
    
    actViewController.excludedActivityTypes = [NSArray arrayWithObjects:UIActivityTypePrint, UIActivityTypeAssignToContact, UIActivityTypeCopyToPasteboard, UIActivityTypeAirDrop, nil];
    
    [self presentViewController:actViewController animated:YES completion:nil];

}

- (IBAction)shareAllButonPressed:(id)sender {
    NSString                    *strShareMsg;
    NSArray                     *aShareItems;
    UIImage                     *imgShare;
    UIActivityViewController    *actViewController;
    NSString                    *allFriends=@"";
    int i;
    
    //get correct name and image of friends
    
    NSLog(@"Here6");
    for (i=0; i<10; i++) {
        allFriends=[allFriends stringByAppendingString:friends[i]];
    }
    strShareMsg = allFriends;
    NSLog(@"Here7");
    imgShare    = [UIImage imageNamed:@"Amigos.jpg"];
    NSLog(@"Here8");
    NSLog(strShareMsg);
    aShareItems = @[imgShare, strShareMsg];
    
    
    actViewController = [[UIActivityViewController alloc] initWithActivityItems:aShareItems applicationActivities:nil];
    
    actViewController.excludedActivityTypes = [NSArray arrayWithObjects:UIActivityTypePrint, UIActivityTypeAssignToContact, UIActivityTypeCopyToPasteboard, UIActivityTypeAirDrop, nil];
    
    [self presentViewController:actViewController animated:YES completion:nil];
    
}


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
