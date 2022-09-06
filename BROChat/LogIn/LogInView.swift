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
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: logInViewConstants.insets),
            closeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -logInViewConstants.insets),
            closeButton.widthAnchor.constraint(equalToConstant: logInViewConstants.closeButtonSize),
            closeButton.heightAnchor.constraint(equalToConstant: logInViewConstants.closeButtonSize),
            logInLabel.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: logInViewConstants.textFieldsHeight),
            logInLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: logInViewConstants.insets),
            
            stack.topAnchor.constraint(equalTo: self.logInLabel.bottomAnchor,constant: logInViewConstants.insets),
            stack.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            emailTF.heightAnchor.constraint(equalToConstant: logInViewConstants.textFieldsHeight),
            emailTF.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            emailTF.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            passwordTF.heightAnchor.constraint(equalToConstant: logInViewConstants.textFieldsHeight),
            passwordTF.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            passwordTF.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            logInButton.heightAnchor.constraint(equalToConstant: logInViewConstants.logInButtonHeight),
            logInButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            logInButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor)
             
        ])
        
    }
    
    func createStackView() -> UIStackView {
        let stack = UIStackView(arrangedSubviews: [emailTF,passwordTF,logInButton])
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

private struct logInViewConstants {
    static let textFieldsHeight: CGFloat = 50
    static let logInButtonHeight: CGFloat = 50
    static let insets: CGFloat = 20
    static let closeButtonSize: CGFloat = 30
}
