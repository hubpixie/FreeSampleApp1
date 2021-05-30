import UIKit

protocol HomeRouter {}

/// ホーム画面の画面遷移処理
class HomeRouterImpl: HomeRouter {
    fileprivate weak var viewController: HomeViewController?

    init(view: HomeViewController) {
        viewController = view
    }
}
