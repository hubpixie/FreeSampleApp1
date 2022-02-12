//
//  ViewController.m
//  DummyObjcApp-01
//
//  Created by 海鮮ドン on 2022/02/12.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *sizedContainerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self applyScreenWidthIfNeed];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)applyScreenWidthIfNeed {
    NSInteger index = 0;
    CGFloat constantLeadingDelta = 0;
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad
        || self.view.bounds.size.width > 420) {
        constantLeadingDelta = (self.view.bounds.size.width - 375) / 2.0;
    }
    if (constantLeadingDelta <= 0) {
        return;
    }
    for (NSLayoutConstraint *anchor in _sizedContainerView.constraints) {
        
        if ((anchor.firstItem == _sizedContainerView || anchor.secondItem == _sizedContainerView)
            &&  anchor.firstAttribute == NSLayoutAttributeLeading) {
            NSLog(@"first leading = %@", anchor.secondItem);
            anchor.constant = constantLeadingDelta;
        }
        if ((anchor.firstItem == _sizedContainerView || anchor.secondItem == _sizedContainerView)
            && anchor.firstAttribute == NSLayoutAttributeTrailing) {
            NSLog(@"first leading = %@", anchor.secondItem);
            anchor.constant = constantLeadingDelta;
        }
        /*
        NSLog(@"anchor[%ld]----------START---", index);
        NSLog(@"anchor = %@", anchor);
        NSLog(@"description = %@", anchor.description);
        NSLog(@"relation = %ld", anchor.relation);
        NSLog(@"active = %d", anchor.active);
        NSLog(@"identifier = %@", anchor.identifier);
        NSLog(@"constant = %f", anchor.constant);
        NSLog(@"priority = %f", anchor.priority);
        NSLog(@"multiplier = %f", anchor.multiplier);
        NSLog(@"firstItem = %@", anchor.firstItem);
        NSLog(@"secondItem = %@", anchor.secondItem);
        NSLog(@"firstAttribute = %ld", anchor.firstAttribute);
        NSLog(@"secondAttribute = %ld", anchor.secondAttribute);
        NSLog(@"secondAnchor = %@", anchor.secondAnchor);
        NSLog(@"anchor[%ld]----------END---", index);
        index ++;
        */
    }
}
@end
