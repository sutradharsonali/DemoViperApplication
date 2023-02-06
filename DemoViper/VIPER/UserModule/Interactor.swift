
import Foundation

class UserInteractor : PresenterToInteractorProtocol{
   
    var presenter: InteractorToPresenterProtocol?
    var network : NetworkManager?
    func fetchUser() {
        network = NetworkManager(manager: self)
        network?.getUsers()
    }
}


extension UserInteractor : NetworkManagerToInteractorProtocol{
    
    func apiFetchedSuccess(userModelArray: Array<User>) {
        self.presenter?.userFetchedSuccess(userModelArray: userModelArray)
    }
    
    func apiFetchFailed() {
        self.presenter?.userFetchFailed()
    }
    
    
}


