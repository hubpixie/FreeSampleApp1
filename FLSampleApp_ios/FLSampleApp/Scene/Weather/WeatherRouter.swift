import UIKit

protocol WeatherRouter {}

/// てんき画面の画面遷移処理
class WeatherRouterImpl: WeatherRouter {
    fileprivate weak var viewController: WeatherViewController?

    init(view: WeatherViewController) {
        viewController = view
    }
}
