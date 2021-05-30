protocol MiscConfigurator {
    func configure(dependency: MiscViewController)
}

/// その他画面の初期化
class MiscConfiguratorImpl: MiscConfigurator {
    func configure(dependency: MiscViewController) {
        let router = MiscRouterImpl(view: dependency)
        let presenter = MiscPresenterImpl(view: dependency, router: router)
        dependency.presenter = presenter
    }
}
