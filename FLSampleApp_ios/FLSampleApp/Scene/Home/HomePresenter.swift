protocol HomePresenter {}

/// ホーム画面の表示処理
class HomePresenterImpl: HomePresenter {
    fileprivate var view: HomeView?
    private(set) var router: HomeRouter
    /* private(set) var usecase: HomeUsecase */

    init(view: HomeViewController,
         router: HomeRouter /* ,
          usecase: HomeUsecase */ )
    {
        self.view = view
        self.router = router
        /* self.usecase = usecase */ // TODO: Usecase使用する想定
    }
}
