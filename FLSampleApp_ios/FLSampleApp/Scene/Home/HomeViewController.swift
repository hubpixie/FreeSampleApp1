import UIKit

protocol HomeView {}

/// ホーム画面の本体
class HomeViewController: BaseViewController {
    // MARK: - Types / Constants

    // MARK: - Outlets

    // MARK: - Variables

    var presenter: HomePresenter!

    // MARK: - HomeViewController Methods (can override)

    override func viewDidLoad() {
        super.viewDidLoad()

        // other codes...
    }
}

// MARK: - Actions

extension HomeViewController {}

// MARK: - Private Methods

extension HomeViewController {}

// MARK: - Private Methods

extension HomeViewController {}

// MARK: - Delegate Methods

extension HomeViewController: HomeView {}
