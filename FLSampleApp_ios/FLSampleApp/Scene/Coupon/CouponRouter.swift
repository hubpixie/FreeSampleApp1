import UIKit

protocol CouponRouter {}

/// クーポン画面の画面遷移処理
class CouponRouterImpl: CouponRouter {
    fileprivate weak var viewController: CouponViewController?

    init(view: CouponViewController) {
        viewController = view
    }
}
