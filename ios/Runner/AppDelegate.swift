import UIKit
import Flutter
import FirebaseCore
import FBSDKCoreKit
import FirebaseAuth



@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    FirebaseApp.configure()
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

//func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
//    guard let url = URLContexts.first?.url else {
//        return
//    }
//
//    ApplicationDelegate.shared.application(
//        UIApplication.shared,
//        open: url,
//        sourceApplication: nil,
//        annotation: [UIApplication.OpenURLOptionsKey.annotation]
//    )
//}
