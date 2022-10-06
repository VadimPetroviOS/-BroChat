//
//  SignInView.swift
//  BROChat
//
//  Created by Вадим on 30.08.2022.
//

import Foundation
import UIKit

protocol SignUpViewControllerDelegate: AnyObject {
    func presentPicker()
    func closeAction()
    func signUpAction(userName: String, email: String, password: String)
}

class SignUpView: UIView {
    
    weak var delegate: SignUpViewControllerDelegate?
    
    var constraintsWithErrorLabel = [NSLayoutConstraint]()
    var constraintsWithoutErrorLabel = [NSLayoutConstraint]()
    
    let closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        button.contentMode = .scaleToFill
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let signUpLabel: UILabel = {
        let label = UILabel()
        label.text = "Привет, Бро"
        label.font = .boldSystemFont(ofSize: 25)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let avatarImage: UIImageView = {
        let avatar = UIImageView()
        avatar.image = UIImage(named: "camera")
        avatar.backgroundColor = .gray
        avatar.layer.cornerRadius = SignUpViewConstants.avatarSize/2
        avatar.clipsToBounds = true
        avatar.translatesAutoresizingMaskIntoConstraints = false
        avatar.isUserInteractionEnabled = true
        return avatar
    }()

    let nicknameTF: UITextField = {
        let textfield = UITextField()
        textfield.attributedPlaceholder = NSAttributedString(
            string: " Enter your Broname",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        textfield.layer.cornerRadius = 5
        textfield.backgroundColor = UIColor.black
        textfield.textColor = .white
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.layer.borderWidth = 1.5
        textfield.layer.borderColor = UIColor.gray.cgColor
        return textfield
    }()
    
    let emailTF: UITextField = {
        let textfield = UITextField()
        textfield.attributedPlaceholder = NSAttributedString(
            string: " Bromail",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        textfield.layer.cornerRadius = 5
        textfield.backgroundColor = UIColor.black
        textfield.textColor = .white
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.layer.borderWidth = 1.5
        textfield.layer.borderColor = UIColor.gray.cgColor
        return textfield
    }()
    
    let passwordTF: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(
            string: " Brossword",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        textField.layer.cornerRadius = 5
        textField.backgroundColor = UIColor.black
        textField.textColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderWidth = 1.5
        textField.layer.borderColor = UIColor.gray.cgColor
        return textField
    }()
    
    let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        //button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        button.backgroundColor = .darkGray
        button.setTitle("BROOOO", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self,
                         action: #selector(signUpPressed),
                         for: .touchUpInside)
        return button
    }()
    
    let errorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemRed
        label.font = .systemFont(ofSize: 17, weight: .thin)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        setConstraints()
        configAvatar()
    }
    
    private func setConstraints() {
        
        let stack = UIStackView(arrangedSubviews: [nicknameTF, emailTF, passwordTF, signUpButton])
        stack.axis = .vertical
        stack.spacing = 20
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(closeButton)
        self.addSubview(signUpLabel)
        self.addSubview(avatarImage)
        self.addSubview(stack)
        
        constraintsWithoutErrorLabel = [
            stack.topAnchor.constraint(equalTo: avatarImage.bottomAnchor,
                                       constant: SignUpViewConstants.insets),
        ]
        constraintsWithErrorLabel = [
            errorLabel.topAnchor.constraint(equalTo: stack.bottomAnchor,
                                            constant: SignUpViewConstants.insets),
            errorLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                constant: SignUpViewConstants.insets),
            errorLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                constant: -SignUpViewConstants.insets),
        ]
        
        NSLayoutConstraint.activate([
            
            closeButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: SignUpViewConstants.insets),
            closeButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -SignUpViewConstants.insets),
            closeButton.widthAnchor.constraint(equalToConstant: SignUpViewConstants.closeButtonSize),
            closeButton.heightAnchor.constraint(equalToConstant: SignUpViewConstants.closeButtonSize),
            
            signUpLabel.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: SignUpViewConstants.insets),
            signUpLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: SignUpViewConstants.insets),
            
            avatarImage.widthAnchor.constraint(equalToConstant: SignUpViewConstants.avatarSize),
            avatarImage.heightAnchor.constraint(equalToConstant: SignUpViewConstants.avatarSize),
            avatarImage.topAnchor.constraint(equalTo: signUpLabel.bottomAnchor, constant: SignUpViewConstants.insets),
            avatarImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            stack.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 30),
            stack.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            stack.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            
            nicknameTF.heightAnchor.constraint(equalToConstant: 50),
            nicknameTF.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            nicknameTF.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            emailTF.heightAnchor.constraint(equalToConstant: 50),
            emailTF.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            emailTF.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            passwordTF.heightAnchor.constraint(equalToConstant: 50),
            passwordTF.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            passwordTF.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            signUpButton.heightAnchor.constraint(equalToConstant: 50),
            signUpButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            signUpButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor)
        ] + constraintsWithoutErrorLabel)
        
        
    }
    
    func addErrorLabels(for textField: UITextField, error: String? = nil){
        switch textField {
        case nicknameTF: errorLabel.text = SignUpErrors.emptyNicknameField.rawValue
            nicknameTF.becomeFirstResponder()
        case emailTF: errorLabel.text = SignUpErrors.emptyEmailField.rawValue
            emailTF.becomeFirstResponder()
        case passwordTF: errorLabel.text = SignUpErrors.emptyPasswordField.rawValue
            passwordTF.becomeFirstResponder()
        default: errorLabel.text = error
        }
        self.addSubview(errorLabel)
        constraintsWithoutErrorLabel.forEach {$0.isActive = false}
        constraintsWithErrorLabel.forEach {$0.isActive = true}
    }
    
    func configAvatar() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(avatarTapped))
        avatarImage.addGestureRecognizer(tapGesture)
    }
    
    @objc private func avatarTapped(_ gesture: UITapGestureRecognizer) {
        delegate?.presentPicker()
    }
    
    @objc private func closeButtonTapped() {
        delegate?.closeAction()
    }
    
    @objc private func signUpPressed() {
        guard let userName = nicknameTF.text, nicknameTF.hasText else {
            addErrorLabels(for: nicknameTF)
            return
        }
        guard let email = emailTF.text, emailTF.hasText else {
            addErrorLabels(for: emailTF)
            return
        }
        guard let password = passwordTF.text, passwordTF.hasText else {
            addErrorLabels(for: passwordTF)
            return
        }
        delegate?.signUpAction(userName: userName, email: email, password: password)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

private struct SignUpViewConstants {
    static let textFieldsHeight: CGFloat = 50
    static let signUpButtonHeight: CGFloat = 50
    static let insets: CGFloat = 20
    static let closeButtonSize: CGFloat = 30
    static let avatarSize: CGFloat = 100
}

enum SignUpErrors: String {
    case emptyEmailField = "Please enter email"
    case emptyPasswordField = "Please enter password"
    case emptyNicknameField = "Please enter username"
}
