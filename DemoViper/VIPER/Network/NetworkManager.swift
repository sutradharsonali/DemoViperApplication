
import Foundation

protocol NetworkManagerToInteractorProtocol: AnyObject{
    func apiFetchedSuccess(userModelArray:Array<User>)
    func apiFetchFailed()

}


class NetworkManager {
    
    init(manager : NetworkManagerToInteractorProtocol){
        self.manager = manager
    }
    
    var manager: NetworkManagerToInteractorProtocol?
    
    func getUsers() {
        print("Fetching")
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users")else {return}
        URLSession.shared.dataTask(with: url) { (data, serverResponse, error) in
            guard let data = data, error == nil else{
                self.manager?.apiFetchFailed()
                return
            }
                
                do {
                    let result = try JSONDecoder().decode([User].self, from: data)
                    self.manager?.apiFetchedSuccess(userModelArray: result)
                } catch  {
                    self.manager?.apiFetchFailed()
                }
            
        }.resume()
        
    }
}
