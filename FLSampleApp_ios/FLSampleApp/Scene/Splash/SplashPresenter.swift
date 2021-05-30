protocol SplashPresenter {
    func startTop()
}

/// スプラッシュ画面の表示処理
class SplashPresenterImpl: SplashPresenter {
    fileprivate var view: SplashView?
    private(set) var router: SplashRouter
    /* private(set) var usecase: SplashUsecase */

    init(view: SplashViewController,
         router: SplashRouter /* ,
          usecase: SplashUsecase */ )
    {
        self.view = view
        self.router = router
        /* self.usecase = usecase */ // TODO: Usecase使用する想定
    }

    func startTop() {
        router.gotoTop()
    }
}
