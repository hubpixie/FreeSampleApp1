protocol SplashConfigurator {
    func configure(dependency: SplashViewController)
}

/// スプラッシュ画面の初期化
class SplashConfiguratorImpl: SplashConfigurator {
    func configure(dependency: SplashViewController) {
        let router = SplashRouterImpl(view: dependency)
        let presenter = SplashPresenterImpl(view: dependency, router: router)
        dependency.presenter = presenter
    }
}
