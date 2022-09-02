//
//  SignInView.swift
//  BROChat
//
//  Created by Вадим on 30.08.2022.
//

import Foundation
import UIKit

class SignUpView: UIView {
    
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
        label.font = .boldSystemFont(ofSize: 30)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let avatarImage: UIImageView = {
        let avatar = UIImageView()
        avatar.image = UIImage(systemName: "camera")
        avatar.backgroundColor = .gray
        avatar.layer.cornerRadius = 50
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
        textfield.backgroundColor = UIColor(white: 0.9, alpha: 0.8)
        textfield.textColor = .darkGray
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    let passwordTF: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(
            string: " Brossword",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        textField.layer.cornerRadius = 5
        textField.backgroundColor = UIColor(white: 0.9, alpha: 0.8)
        textField.textColor = .darkGray
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        //button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        button.backgroundColor = .gray
        button.setTitle("BROOOO", for: .normal)
        /*
        button.addTarget(self,
                         action: #selector(signUpPressed),
                         for: .touchUpInside)
        */
        return button
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        setConstraints()
    }
    
    private func setConstraints() {
        
        let stack = UIStackView(arrangedSubviews: [nicknameTF, emailTF, passwordTF, signUpButton])
        stack.axis = .vertical
        stack.spacing = 20
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(signUpLabel)
        self.addSubview(avatarImage)
        self.addSubview(stack)
        
        NSLayoutConstraint.activate([
            
            signUpLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50),
            
            avatarImage.widthAnchor.constraint(equalToConstant: 100),
            avatarImage.heightAnchor.constraint(equalToConstant: 100),
            avatarImage.topAnchor.constraint(equalTo: signUpLabel.bottomAnchor, constant: 30),
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
        ])
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
