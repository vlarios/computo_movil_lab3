//
//  AerolineaViewController.m
//  Lab3
//
//  Created by Victor Larios on 10/12/14.
//
//

#import "AerolineaViewController.h"

NSString *str_arrayAero[4] = {@"AMX", @"VOI", @"AIJ", @"VIV"};

NSString *str_arrayOrigen1[3] = {@"GDL", @"MTY", @"PBC"};

NSString *str_arrayOrigen2[3] = {@"HMO", @"CUL", @"QRO"};

NSString *str_arrayOrigen3[3] = {@"TLC", @"SLP", @"CUU"};
NSString *str_arrayOrigen4[3] = {@"MXL", @"TIJ", @"MAM"};

NSString *str_arrayDestino1[3] = {@"CUN", @"MZT", @"ZLO"};

NSString *str_arrayDestino2[3] = {@"SJD", @"ACA", @"PVR"};

NSString *str_arrayDestino3[3] = {@"VER", @"VSA", @"TGZ"};

NSString *str_arrayDestino4[3] = {@"TPQ", @"REX", @"CJS"};
NSString *str_arrayLogos[4] = {@"aeromexico.png", @"volaris.jpg", @"interjet.jpg", @"vivaaero.png"};
    

NSString *str_arrayOrigen[3] = {@"", @"", @""};
NSString *str_arrayDestino[3] = {@"", @"", @""};

NSString *strAeroSel;
NSString *strOrigenSel;
NSString *strDestinoSel;



NSInteger rowAero=0;
NSInteger rowOrigen=0;
NSInteger rowDestino=0;

@interface AerolineaViewController ()

@end

@implementation AerolineaViewController

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

- (IBAction)btnSelect:(id)sender {
    self.lblAero.text = str_arrayAero[rowAero];
    self.lblOrigen.text = str_arrayOrigen[rowOrigen];
    self.lblDestino.text = str_arrayDestino[rowDestino];
}

- (IBAction)btnShare:(id)sender {
    NSArray                     *aShareItems;
    UIImage                     *imgShare;
    UIActivityViewController    *actViewController;
    NSString *strAero=@"Aerolinea ";
    NSString *strOrigen=@"Origen ";
    NSString *strDestino=@"Destino ";
    
    //get correct name and image of friends
    
    
    
    strAero=[strAero stringByAppendingString:str_arrayAero[rowAero]];
    strOrigen=[strOrigen stringByAppendingString:str_arrayOrigen[rowOrigen]];
    strDestino=[strDestino stringByAppendingString:str_arrayDestino[rowDestino]];


    
    imgShare    = [UIImage imageNamed:str_arrayLogos[rowAero]];
    
    
    aShareItems = @[imgShare, strAero, strOrigen, strDestino];
    
    actViewController = [[UIActivityViewController alloc] initWithActivityItems:aShareItems applicationActivities:nil];
    
    actViewController.excludedActivityTypes = [NSArray arrayWithObjects:UIActivityTypePrint, UIActivityTypeAssignToContact, UIActivityTypeCopyToPasteboard, UIActivityTypeAirDrop, nil];
    
    [self presentViewController:actViewController animated:YES completion:nil];
}

- (NSInteger)numberOfComponentsInPickerView:
(UIPickerView *)pickerView
{
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    if (component==0) {
        return 4;
    }
    else {
        return 3;
    }
    
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 40;
}



- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    if (component==0) {
        return str_arrayAero[row];
    }
    else if (component==1) {
        if ([pickerView selectedRowInComponent:0]==0) {
            str_arrayOrigen[0] = str_arrayOrigen1[0];
            str_arrayOrigen[1] = str_arrayOrigen1[1];
            str_arrayOrigen[2] = str_arrayOrigen1[2];
        }
        else if ([pickerView selectedRowInComponent:0]==1) {
            str_arrayOrigen[0] = str_arrayOrigen2[0];
            str_arrayOrigen[1] = str_arrayOrigen2[1];
            str_arrayOrigen[2] = str_arrayOrigen2[2];
        }
        else if ([pickerView selectedRowInComponent:0]==2) {
            str_arrayOrigen[0] = str_arrayOrigen3[0];
            str_arrayOrigen[1] = str_arrayOrigen3[1];
            str_arrayOrigen[2] = str_arrayOrigen3[2];
        }
        else if ([pickerView selectedRowInComponent:0]==3) {
            str_arrayOrigen[0] = str_arrayOrigen4[0];
            str_arrayOrigen[1] = str_arrayOrigen4[1];
            str_arrayOrigen[2] = str_arrayOrigen4[2];
        }
        return str_arrayOrigen[row];
    }
    else {
        if ([pickerView selectedRowInComponent:0]==0) {
            str_arrayDestino[0] = str_arrayDestino1[0];
            str_arrayDestino[1] = str_arrayDestino1[1];
            str_arrayDestino[2] = str_arrayDestino1[2];
        }
        else if ([pickerView selectedRowInComponent:0]==1) {
            str_arrayDestino[0] = str_arrayDestino2[0];
            str_arrayDestino[1] = str_arrayDestino2[1];
            str_arrayDestino[2] = str_arrayDestino2[2];
        }
        else if ([pickerView selectedRowInComponent:0]==2) {
            str_arrayDestino[0] = str_arrayDestino3[0];
            str_arrayDestino[1] = str_arrayDestino3[1];
            str_arrayDestino[2] = str_arrayDestino3[2];
        }
        else if ([pickerView selectedRowInComponent:0]==3) {
            str_arrayDestino[0] = str_arrayDestino4[0];
            str_arrayDestino[1] = str_arrayDestino4[1];
            str_arrayDestino[2] = str_arrayDestino4[2];
        }
        return str_arrayDestino[row];
    }
    
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
      inComponent:(NSInteger)component
{
    if (component==0) {
        rowAero=row;
    }
    if (component==1) {
        rowOrigen=row;
    }
    if (component==2) {
        rowDestino=row;
    }
    [pickerView reloadAllComponents];
    
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
