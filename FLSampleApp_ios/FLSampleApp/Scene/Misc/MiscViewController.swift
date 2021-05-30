import UIKit

protocol MiscView {}

/// その他画面の本体
class MiscViewController: BaseViewController {
    // MARK: - Types / Constants

    // MARK: - Outlets

    // MARK: - Variables

    var presenter: MiscPresenter!

    // MARK: - MiscViewController Methods (can override)

    override func viewDidLoad() {
        super.viewDidLoad()

        // other codes...
    }
}

// MARK: - Actions

extension MiscViewController {}

// MARK: - Private Methods

extension MiscViewController {}

// MARK: - Private Methods

extension MiscViewController {}

// MARK: - Delegate Methods

extension MiscViewController: MiscView {}
