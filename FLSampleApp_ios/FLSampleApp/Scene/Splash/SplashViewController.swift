import UIKit

protocol SplashView {}

/// スプラッシュ画面の本体
class SplashViewController: BaseViewController {
    // MARK: - Types / Constants

    // MARK: - Outlets

    // MARK: - Variables

    var presenter: SplashPresenter!

    // MARK: - SplashViewController Methods (can override)

    override func viewDidLoad() {
        super.viewDidLoad()

        // other codes...
        view.backgroundColor = .baseBackColor()

        // Indicator View
        indicatorView.startAnimating()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { [weak self] in
            self?.presenter?.startTop()
            self?.indicatorView.stopAnimating()
        }
    }
}

// MARK: - Actions

extension SplashViewController {}

// MARK: - Private Methods

extension SplashViewController {}

// MARK: - Private Methods

extension SplashViewController {}

// MARK: - Delegate Methods

extension SplashViewController: SplashView {}
