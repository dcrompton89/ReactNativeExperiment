/**
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */


#import "AppDelegate.h"
#import "RCTBridge.h"
#import "RCTJavaScriptLoader.h"
#import "RCTRootView.h"
#import "RCTLinkingManager.h"

@interface AppDelegate() <RCTBridgeDelegate>

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

  _bridge = [[RCTBridge alloc] initWithDelegate:self
                                  launchOptions:launchOptions];
  
  
  RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:_bridge
                                                   moduleName:@"testReact"
                                            initialProperties:nil];
  
  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  UIViewController *rootViewController = [UIViewController new];
  rootViewController.view = rootView;
  self.window.rootViewController = rootViewController;
  [self.window makeKeyAndVisible];
  return YES;
  
}

- (NSURL *)sourceURLForBridge:(__unused RCTBridge *)bridge
{
  NSURL *sourceURL;

  sourceURL = [NSURL URLWithString:@"http://localhost:8081/index.ios.bundle?platform=ios&dev=true"];
   
  if (!getenv("CI_USE_PACKAGER")) {
  //  sourceURL = [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
  }
  
  return sourceURL;
}


- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
  return [RCTLinkingManager application:application openURL:url
                      sourceApplication:sourceApplication annotation:annotation];
}

- (void)loadSourceForBridge:(RCTBridge *)bridge
                  withBlock:(RCTSourceLoadBlock)loadCallback
{
  [RCTJavaScriptLoader loadBundleAtURL:[self sourceURLForBridge:bridge]
                            onComplete:loadCallback];
}

@end
