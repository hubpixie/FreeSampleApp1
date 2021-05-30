protocol CouponConfigurator {
    func configure(dependency: CouponViewController)
}

/// クーポン画面の初期化
class CouponConfiguratorImpl: CouponConfigurator {
    func configure(dependency: CouponViewController) {
        let router = CouponRouterImpl(view: dependency)
        let presenter = CouponPresenterImpl(view: dependency, router: router)
        dependency.presenter = presenter
    }
}
