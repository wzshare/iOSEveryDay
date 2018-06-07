//
//  FRPFullSizePhotoViewController.m
//  FunctionalReactivePixel
//
//  Created by wangzhe on 2018/6/6.
//  Copyright © 2018年 wangzhe. All rights reserved.
//

#import "FRPFullSizePhotoViewController.h"
#import "FRPPhotoViewController.h"
#import "FRPPhotoViewModel.h"

@interface FRPFullSizePhotoViewController () <UIPageViewControllerDataSource, UIPageViewControllerDelegate>
@property (nonatomic, strong) UIPageViewController *pageViewController;
@end

@implementation FRPFullSizePhotoViewController

- (instancetype)init {
    self = [super init];
    if (self) {
//        self.title = [self.photoModelArray[photoIndex] photoName];
        self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:@{ UIPageViewControllerOptionInterPageSpacingKey: @(30)}];
        self.pageViewController.dataSource = self;
        self.pageViewController.delegate = self;
        [self addChildViewController:self.pageViewController];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Configure child view controllers
    [self.pageViewController setViewControllers:@[[self photoViewControllerForIndex:self.viewModel.initialPhotoIndex]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Configure self
    self.title = self.viewModel.initialPhotoName;

    self.view.backgroundColor = [UIColor blackColor];
    self.pageViewController.view.frame = self.view.bounds;
    [self.view addSubview:self.pageViewController.view];
}

- (FRPPhotoViewController *)photoViewControllerForIndex:(NSInteger)index{
    FRPPhotoModel *photoModel = [self.viewModel photoModelAtIndex:index];
    if (photoModel){
        FRPPhotoViewModel *photoViewModel = [[FRPPhotoViewModel alloc] initWithModel:photoModel];
        FRPPhotoViewController *photoViewController = [[FRPPhotoViewController alloc] initWithViewModel:photoViewModel index:index];
        return photoViewController;
    }
    
    //Index was out of bounds, return nil
    return nil;
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed {
    self.title = [((FRPPhotoViewController *)self.pageViewController.viewControllers.firstObject).viewModel photoName];
    if (self.delegate && [self.delegate respondsToSelector:@selector(userDidScroll:toPhotoAtIndex:)]) {
        [self.delegate userDidScroll:self toPhotoAtIndex:[self.pageViewController.viewControllers.firstObject photoIndex]];
    }
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(FRPPhotoViewController *)viewController{
    return [self photoViewControllerForIndex:viewController.photoIndex - 1];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(FRPPhotoViewController *)viewController {
    return [self photoViewControllerForIndex:viewController.photoIndex + 1];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
