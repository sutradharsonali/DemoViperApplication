
import UIKit

class ViewController: UIViewController {
    
    var presentor:ViewToPresenterProtocol?
    var usertableView: UITableView  =   UITableView()
    var users: [User] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        
        presentor?.startFetchingUser()
        createView()
    }
    
    func createView() {
        
        let barHeight: CGFloat = 100
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        usertableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        usertableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        usertableView.backgroundColor = .white
        usertableView.delegate = self
        usertableView.dataSource = self
        self.view.addSubview(usertableView)
        self.usertableView.reloadData()
    }
    
}

extension ViewController :PresenterToViewProtocol{
    
    func showUser(userArray: Array<User>) {
        self.users = userArray
        DispatchQueue.main.async {
            self.usertableView.reloadData()
        }
       
        
    }
    
    func showError() {
        print("Something Wrong!!!")
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching UserDetails", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
}

extension ViewController :UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = users[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let nav = navigationController {
            presentor?.showNextViewController(navigationController: nav)
        }
        
    }
    
}
