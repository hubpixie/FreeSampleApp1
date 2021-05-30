protocol MiscPresenter {}

/// その他画面の表示処理
class MiscPresenterImpl: MiscPresenter {
    fileprivate var view: MiscView?
    private(set) var router: MiscRouter
    /* private(set) var usecase: MiscUsecase */

    init(view: MiscViewController,
         router: MiscRouter /* ,
          usecase: MiscUsecase */ )
    {
        self.view = view
        self.router = router
        /* self.usecase = usecase */ // TODO: Usecase使用する想定
    }
}
