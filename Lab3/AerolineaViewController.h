//
//  AerolineaViewController.h
//  Lab3
//
//  Created by Victor Larios on 10/12/14.
//
//

#import <UIKit/UIKit.h>

@interface AerolineaViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIPickerView *pkrAero;
@property (strong, nonatomic) IBOutlet UILabel *lblAero;
@property (strong, nonatomic) IBOutlet UILabel *lblOrigen;
@property (strong, nonatomic) IBOutlet UILabel *lblDestino;
@property (strong, nonatomic) IBOutlet UIButton *btnSelect;
@property (strong, nonatomic) IBOutlet UIButton *btnShare;

@end
