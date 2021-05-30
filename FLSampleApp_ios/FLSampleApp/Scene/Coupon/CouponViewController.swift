import UIKit

protocol CouponView {}

/// クーポン画面の本体
class CouponViewController: BaseViewController {
    // MARK: - Types / Constants

    // MARK: - Outlets

    // MARK: - Variables

    var presenter: CouponPresenter!

    // MARK: - CouponViewController Methods (can override)

    override func viewDidLoad() {
        super.viewDidLoad()

        // other codes...
    }
}

// MARK: - Actions

extension CouponViewController {}

// MARK: - Private Methods

extension CouponViewController {}

// MARK: - Private Methods

extension CouponViewController {}

// MARK: - Delegate Methods

extension CouponViewController: CouponView {}
