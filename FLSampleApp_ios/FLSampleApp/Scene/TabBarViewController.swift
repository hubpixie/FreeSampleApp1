import UIKit

/// 画面の規定クラス
class TabBarViewController: UITabBarController {
    // MARK: - Types / Constants

    // MARK: - Outlets

    // MARK: - Variables

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setupTabs()
    }
}

// MARK: - Actions

extension TabBarViewController {}

// MARK: - Private Methods

extension TabBarViewController {
    private func setupTabs() {
        viewControllers = [
            { () -> UIViewController in
                let destVC = HomeViewController()
                HomeConfiguratorImpl().configure(dependency: destVC)
                return createTab(for: destVC, title: R.string.localizable.tab_name_home(),
                                 image: R.image.icon_tab_home())
            }(),
            { () -> UIViewController in
                let destVC = CouponViewController()
                CouponConfiguratorImpl().configure(dependency: destVC)
                return createTab(for: destVC, title: R.string.localizable.tab_name_coupon(),
                                 image: R.image.icon_tab_coupon())
            }(),
            { () -> UIViewController in
                let destVC = WeatherViewController()
                WeatherConfiguratorImpl().configure(dependency: destVC)
                return createTab(for: destVC, title: R.string.localizable.tab_name_weather(),
                                 image: R.image.icon_tab_weather())
            }(),
            { () -> UIViewController in
                let destVC = MiscViewController()
                MiscConfiguratorImpl().configure(dependency: destVC)
                return createTab(for: destVC, title: R.string.localizable.tab_name_misc(),
                                 image: R.image.icon_tab_misc())
            }()
        ]
    }

    private func createTab(for viewController: UIViewController,
                           title: String,
                           image: UIImage?) -> UIViewController
    {
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        // set font for title
        navController.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: ViewUtil.baseFont(20)]

        // set font for navigation bar buttons
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font:
                ViewUtil.baseFont(16, isBold: true)], for: UIControl.State.normal)
        viewController.navigationItem.title = title
        return navController
    }
}

// MARK: - Private Methods

extension TabBarViewController {}
