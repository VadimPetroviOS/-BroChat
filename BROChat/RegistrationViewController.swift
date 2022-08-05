//
//  RegistrationViewController.swift
//  BROChat
//
//  Created by Вадим on 04.08.2022.
//

import UIKit

class RegistrationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        subView()
        addConstraints()
    }
    
    private let logTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 25
        textField.clipsToBounds = true
        textField.placeholder = "ИмяBro"
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private let passTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 25
        textField.clipsToBounds = true
        textField.placeholder = "ПарольBro"
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private func addConstraints() {
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(logTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50))
        constraints.append(logTextField.widthAnchor.constraint(equalToConstant: 400))
        constraints.append(logTextField.heightAnchor.constraint(equalToConstant: 50))
        constraints.append(logTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        
        constraints.append(passTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120))
        constraints.append(passTextField.widthAnchor.constraint(equalToConstant: 400))
        constraints.append(passTextField.heightAnchor.constraint(equalToConstant: 50))
        constraints.append(passTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func subView() {
        view.addSubview(logTextField)
        view.addSubview(passTextField)
    }

}
