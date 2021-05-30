protocol WeatherPresenter {}

/// てんき画面の表示処理
class WeatherPresenterImpl: WeatherPresenter {
    fileprivate var view: WeatherView?
    private(set) var router: WeatherRouter
    /* private(set) var usecase: WeatherUsecase */

    init(view: WeatherViewController,
         router: WeatherRouter /* ,
          usecase: WeatherUsecase */ )
    {
        self.view = view
        self.router = router
        /* self.usecase = usecase */ // TODO: Usecase使用する想定
    }
}
