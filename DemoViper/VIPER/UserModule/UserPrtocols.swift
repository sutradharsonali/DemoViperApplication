//
//  UserPrtocols.swift
//  DemoViper
//
//  Created by Sonali on 06/02/23.
//

import Foundation
import UIKit

protocol ViewToPresenterProtocol: AnyObject{
    
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func startFetchingUser()
    func showNextViewController(navigationController:UINavigationController)

}

protocol PresenterToViewProtocol: AnyObject{
    func showUser(userArray:Array<User>)
    func showError()
}

protocol PresenterToRouterProtocol: AnyObject {
    static func createModule()-> ViewController
    func pushToNextScreen(navigationConroller:UINavigationController)
}

protocol PresenterToInteractorProtocol: AnyObject {
    var presenter:InteractorToPresenterProtocol? {get set}
    func fetchUser()
}

protocol InteractorToPresenterProtocol: AnyObject {
    func userFetchedSuccess(userModelArray:Array<User>)
    func userFetchFailed()
}

