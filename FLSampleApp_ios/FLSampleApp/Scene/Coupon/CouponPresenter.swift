protocol CouponPresenter {}

/// クーポン画面の表示処理
class CouponPresenterImpl: CouponPresenter {
    fileprivate var view: CouponView?
    private(set) var router: CouponRouter
    /* private(set) var usecase: CouponUsecase */

    init(view: CouponViewController,
         router: CouponRouter /* ,
          usecase: CouponUsecase */ )
    {
        self.view = view
        self.router = router
        /* self.usecase = usecase */ // TODO: Usecase使用する想定
    }
}
