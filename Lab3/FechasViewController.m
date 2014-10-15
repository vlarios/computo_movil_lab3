//
//  FechasViewController.m
//  Lab3
//
//  Created by Victor Larios on 10/12/14.
//
//

#import "FechasViewController.h"

@interface FechasViewController ()

@end

@implementation FechasViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnDateDiffPressed:(id)sender {
    NSLocale *usLocale = [[NSLocale alloc]
                          initWithLocaleIdentifier:@"en_US"];
    
    NSDate *pickerDate1 = [self.dpDate1 date];
    NSDate *pickerDate2 = [self.dpDate2 date];
    
    
    
    NSString *selectionString1 = [[NSString alloc]
                                 initWithFormat:@"%@",
                                 [pickerDate1 descriptionWithLocale:usLocale]];
    NSString *selectionString2 = [[NSString alloc]
                                  initWithFormat:@"%@",
                                  [pickerDate2 descriptionWithLocale:usLocale]];
    
    //NSTimeInterval dateDiff = [pickerDate2 - timeIntervalSinceDate:pickerDate1];
                               
    self.lblDif.text = selectionString1;
    self.lblDif.adjustsFontSizeToFitWidth = YES;
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
