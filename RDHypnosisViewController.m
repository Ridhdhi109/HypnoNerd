//
//  RDHypnosisViewController.m
//  HypnoNerd
//
//  Created by Ridhdhi Desai on 3/13/16.
//  Copyright © 2016 Ridhdhi Desai. All rights reserved.
//

#import "RDHypnosisViewController.h"
#import "RDHypnosisView.h"

@interface RDHypnosisViewController () <UITextFieldDelegate>

@end

@implementation RDHypnosisViewController

-(instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if(self) {
        //Set the tabbar item title
        
        self.tabBarItem.title = @"Hypnotize";
        //Create an UIIMage from a file
        
        UIImage *image = [UIImage imageNamed:@"Hypno.png"];
        
        //put the image on the tab bar item
        self.tabBarItem.image = image;
    }
    
    
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect frame = [UIScreen mainScreen].bounds;
    RDHypnosisView *backgroundView = [[RDHypnosisView alloc] initWithFrame:frame];
    
    CGRect textFieldRect = CGRectMake(40, 70, 240, 30);
    UITextField *textField = [[UITextField alloc] initWithFrame:textFieldRect];
    
    //setting the boarder stype for the text field
    textField.borderStyle = UITextBorderStyleRoundedRect;
    [backgroundView addSubview:textField];
    textField.placeholder = @"Hypnotise Me!";
    textField.returnKeyType = UIReturnKeyDone;
    
    textField.delegate = self;
    
    self.view = backgroundView;
}

-(BOOL) textFieldShouldReturn: (UITextField *) textField {
    NSLog(@"%@", textField.text);
    [self drawHypnoticMessage:textField.text];
    textField.text = @"";
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) drawHypnoticMessage : (NSString *) message; {
    
    for(int i =0; i < 20; i++) {
        
        UILabel *messageLabel = [[UILabel alloc] init];
        //Configure the label's color and text
        
        messageLabel.backgroundColor = [UIColor clearColor];
        messageLabel.textColor = [UIColor whiteColor];
        messageLabel.text = message;
        
        //This method resize the label which will be relative
        //to the text that it is displaying
        
        [messageLabel sizeToFit];
        
        //Get a random x value that fits within the hypnosis view width
        
        int width = self.view.bounds.size.width - messageLabel.bounds.size.width;
        int x = arc4random() % width;
        
        int height = self.view.bounds.size.height - messageLabel.bounds.size.height;
        int y = arc4random() % height;
        
        //Update label's frame
        CGRect frame = messageLabel.frame;
        frame.origin = CGPointMake(x, y);
        messageLabel.frame = frame;
        
        //add label to hierarchy
        [self.view addSubview:messageLabel];
        
        
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
