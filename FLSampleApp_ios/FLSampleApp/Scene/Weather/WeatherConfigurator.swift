protocol WeatherConfigurator {
    func configure(dependency: WeatherViewController)
}

/// てんき画面の初期化
class WeatherConfiguratorImpl: WeatherConfigurator {
    func configure(dependency: WeatherViewController) {
        let router = WeatherRouterImpl(view: dependency)
        let presenter = WeatherPresenterImpl(view: dependency, router: router)
        dependency.presenter = presenter
    }
}
