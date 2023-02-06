
import Foundation
import UIKit

class UserPresenter : ViewToPresenterProtocol {
    
    var view: PresenterToViewProtocol?
    var interactor: PresenterToInteractorProtocol?
    var router: PresenterToRouterProtocol?
    
    func startFetchingUser() {
        interactor?.fetchUser()
    }
    
    func showNextViewController(navigationController: UINavigationController) {
        router?.pushToNextScreen(navigationConroller: navigationController)
    }
}

extension UserPresenter : InteractorToPresenterProtocol{
    func userFetchedSuccess(userModelArray: Array<User>) {
        view?.showUser(userArray: userModelArray)
    }
    
    func userFetchFailed() {
        view?.showError()
    }
    
    
}
