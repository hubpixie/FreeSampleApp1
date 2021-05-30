protocol HomeConfigurator {
    func configure(dependency: HomeViewController)
}

/// ホーム画面の初期化
class HomeConfiguratorImpl: HomeConfigurator {
    func configure(dependency: HomeViewController) {
        let router = HomeRouterImpl(view: dependency)
        let presenter = HomePresenterImpl(view: dependency, router: router)
        dependency.presenter = presenter
    }
}
