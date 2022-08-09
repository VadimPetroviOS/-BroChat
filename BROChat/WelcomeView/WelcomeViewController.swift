//
//  ViewController.swift
//  BROChat
//
//  Created by Вадим on 29.07.2022.
//

import UIKit

final class WelcomeViewController: UIViewController {

    override func loadView() {
        self.view = WelcomeView(frame: .zero)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view().delegate = self
    }
    
    func view() -> WelcomeView {
       return self.view as! WelcomeView
    }
    
}

extension WelcomeViewController: WelcomeViewControllerDelegate {
    func signUp() {
        
    }
    
    func logIn() {
        
    }
    
    func getStartedAction() {
        //let signUpVC = SignUpViewController()
        //navigationController?.present(signUpVC, animated: true)
    }
    
    func logInAction() {
        //let logInVC = LogInViewController()
        //navigationController?.present(logInVC, animated: true)
    }
}
