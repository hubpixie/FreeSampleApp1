import UIKit

protocol WeatherView {}

/// てんき画面の本体
class WeatherViewController: BaseViewController {
    // MARK: - Types / Constants

    // MARK: - Outlets

    // MARK: - Variables

    var presenter: WeatherPresenter!

    // MARK: - WeatherViewController Methods (can override)

    override func viewDidLoad() {
        super.viewDidLoad()

        // other codes...
    }
}

// MARK: - Actions

extension WeatherViewController {}

// MARK: - Private Methods

extension WeatherViewController {}

// MARK: - Private Methods

extension WeatherViewController {}

// MARK: - Delegate Methods

extension WeatherViewController: WeatherView {}
