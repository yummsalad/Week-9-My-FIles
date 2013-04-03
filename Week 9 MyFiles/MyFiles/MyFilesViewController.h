//
//  MyFilesViewController.h
//  MyFiles
//
//  Created by Charles Konkol on 3/25/13.
//  Copyright (c) 2013 RVC Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyFilesViewController : UIViewController
@property (retain, nonatomic) IBOutlet UIView *WebView;
- (IBAction)btnLocal:(id)sender;
- (IBAction)btnWeb:(id)sender;


@end
