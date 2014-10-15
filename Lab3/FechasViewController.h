//
//  FechasViewController.h
//  Lab3
//
//  Created by Victor Larios on 10/12/14.
//
//

#import <UIKit/UIKit.h>

@interface FechasViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIDatePicker *dpDate1;
@property (strong, nonatomic) IBOutlet UIDatePicker *dpDate2;
@property (strong, nonatomic) IBOutlet UIButton *btnDif;
@property (strong, nonatomic) IBOutlet UILabel *lblDif;

@end
