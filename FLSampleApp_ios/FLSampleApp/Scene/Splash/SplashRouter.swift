import UIKit

protocol SplashRouter {
    func gotoTop()
}

/// スプラッシュ画面の画面遷移処理
class SplashRouterImpl: SplashRouter {
    fileprivate weak var viewController: SplashViewController?

    init(view: SplashViewController) {
        viewController = view
    }

    func gotoTop() {
        let window = UIApplication.shared.keyWindow
        window?.rootViewController?.removeFromParent()
        window?.rootViewController = TabBarViewController()
        window?.makeKeyAndVisible()
    }
}
