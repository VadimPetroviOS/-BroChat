//
//  RegistrationView.swift
//  BROChat
//
//  Created by Вадим on 05.08.2022.
//

import UIKit

class LogInView: UIView {
    
    private let closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        button.contentMode = .scaleToFill
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let logInLabel: UILabel = {
        let label = UILabel()
        label.text = "Ждем тебя, BRO!"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailTF: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(
            string: " Bromail",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        textField.layer.cornerRadius = 5
        textField.textColor = .white
        textField.backgroundColor = UIColor.black
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderWidth = 1.5
        textField.layer.borderColor = UIColor.gray.cgColor
        return textField
    }()
    
    private let passwordTF: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(
            string: " Brossword",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        textField.layer.cornerRadius = 5
        textField.textColor = .white
        textField.backgroundColor = UIColor.black
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderWidth = 1.5
        textField.layer.borderColor = UIColor.gray.cgColor
        return textField
    }()
    
    private let logInButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        button.backgroundColor = .darkGray
        button.setTitle("BROOOO", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        addConstraints()
    }
    
    func addConstraints() {
        let stack = createStackView()
        self.addSubview(closeButton)
        self.addSubview(logInLabel)
        self.addSubview(stack)
        self.addSubview(emailTF)
        self.addSubview(passwordTF)
        self.addSubview(logInButton)
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            closeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            closeButton.widthAnchor.constraint(equalToConstant: 20),
            closeButton.heightAnchor.constraint(equalToConstant: 20),
            logInLabel.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 50),
            logInLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            stack.topAnchor.constraint(equalTo: self.logInLabel.bottomAnchor,constant: 50),
            stack.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            emailTF.heightAnchor.constraint(equalToConstant: 50),
            emailTF.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            emailTF.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            passwordTF.heightAnchor.constraint(equalToConstant: 50),
            passwordTF.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            passwordTF.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            logInButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor)
             
        ])
        
    }
    
    func createStackView() -> UIStackView {
        let stack = UIStackView(arrangedSubviews: [emailTF,emailTF,logInButton])
        stack.axis = .vertical
        stack.spacing = 20
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
