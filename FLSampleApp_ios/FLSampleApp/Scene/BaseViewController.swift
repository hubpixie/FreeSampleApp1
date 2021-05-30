import UIKit

/// 画面の規定クラス
class BaseViewController: UIViewController {
    // MARK: - Types / Constants

    // MARK: - Outlets

    // MARK: - Variables

    lazy var indicatorView: UIActivityIndicatorView = {
        let indView = UIActivityIndicatorView()
        indView.center = view.center
        indView.style = .whiteLarge
        indView.color = .gray
        self.view.addSubview(indView)
        return indView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Actions

extension BaseViewController {}

// MARK: - Private Methods

extension BaseViewController {}

// MARK: - Private Methods

extension BaseViewController {}
