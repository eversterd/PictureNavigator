//
//  ViewController.m
//  PictureNavigator
//
//  Created by shiyc on 15/12/8.
//  Copyright © 2015年 shiyc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *indexLabel;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *descLabel;

@property (weak, nonatomic) IBOutlet UIButton *lastBtn;

@property (weak, nonatomic) IBOutlet UIButton *nextBtn;

@property (nonatomic,strong) NSArray *array;

- (IBAction)next;

- (IBAction)last;


@property (nonatomic,assign) int index;

@end

@implementation ViewController

-(void)changedata{
    self.indexLabel.text=[NSString stringWithFormat:@"%d/%zd",self.index+1,self.array.count];
    NSDictionary *dict =self.array[self.index];
    self.imageView.image=[UIImage imageNamed:dict[@"icon"]];
    self.descLabel.text=dict[@"desc"];
    
    self.lastBtn.enabled=(self.index!=0);
    self.nextBtn.enabled=(self.index!=self.array.count-1);

}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self changedata];
    // Do any additional setup after loading the view, typically from a nib.
}

-(NSArray *) array{
    if(_array==nil){
        NSString *path=[[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];
      _array=[NSArray arrayWithContentsOfFile:path];
     
    }
    return _array;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)next {
    self.index++;
    [self changedata];
}

- (IBAction)last {
    self.index--;
    [self changedata];
}

@end
