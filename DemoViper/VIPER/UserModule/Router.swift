
import Foundation
import UIKit

class UserRouter : PresenterToRouterProtocol{
    
    static func createModule() -> ViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = UserPresenter()
        let interactor: PresenterToInteractorProtocol = UserInteractor()
        let router:PresenterToRouterProtocol = UserRouter()        
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        
        return view
    }
    
    func pushToNextScreen(navigationConroller: UINavigationController) {
        print("Navigate to Next ViewController")
    }
    
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
}
