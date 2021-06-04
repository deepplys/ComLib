//
//  SceneDelegate.m
//  ComLib
//
//  Created by 崔祥龙 on 2021/2/8.
//

#import "SceneDelegate.h"
#import "MainRecommendVC.h"
#import "UserInfosVC.h"
#import "LikeItemsVC.h"
#import "SearchVC.h"
#import "Buy/BuyViewController.h"
#import "MainPageRecommendController.h"
#import "MainRecommendCombine/MainRecommendCombineController.h"
#import "LikeItemsAndRecommendCombine/LikePage/LikePageRecommendController.h"
#import "LikeItemsAndRecommendCombine/LikeRecommendCombineController.h"
#import "UserLoginAndRegisterVC.h"
 
@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    self.window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene *)scene];
    UITabBarController *tabBarViewController = [[UITabBarController alloc] init];
    MainRecommendCombineController *mainRecommendVC = [[MainRecommendCombineController alloc] init];
    mainRecommendVC.tabBarItem.title = @"推荐";
    mainRecommendVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_home_normal"];
    mainRecommendVC.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_home"];
    SearchVC *serachVC = [[SearchVC alloc] init];
    serachVC.tabBarItem.title = @"搜索";
    serachVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_search_normal"];
    serachVC.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_search"];
    BuyViewController *controller = [[BuyViewController alloc] init];
    controller.tabBarItem.title = @"消息";
    controller.view.backgroundColor = [UIColor whiteColor];
    //controller.tabBarItem.image = [UIImage imageNamed:@"tabbar_cart_normal"];
    //controller.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_cart"];
    LikeRecommendCombineController *likeItemsVC = [[LikeRecommendCombineController alloc] init];
    likeItemsVC.tabBarItem.title = @"blink";
    likeItemsVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_like_normal"];
    likeItemsVC.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_like"];
    //UserLoginAndRegisterVC *usersInfosVC = [[UserLoginAndRegisterVC alloc] init];
    UserInfosVC *usersInfosVC = [[UserInfosVC alloc] init];
    usersInfosVC.tabBarItem.title = @"个人";
    usersInfosVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_mine_normal"];
    usersInfosVC.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_mine"];
    [tabBarViewController setViewControllers:@[mainRecommendVC, serachVC, likeItemsVC, controller,  usersInfosVC]];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:tabBarViewController];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    [UIApplication sharedApplication].delegate.window = self.window;
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
