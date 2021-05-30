import UIKit

protocol MiscRouter {}

/// その他画面の画面遷移処理
class MiscRouterImpl: MiscRouter {
    fileprivate weak var viewController: MiscViewController?

    init(view: MiscViewController) {
        viewController = view
    }
}
