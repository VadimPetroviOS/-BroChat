//
//  SignInView.swift
//  BROChat
//
//  Created by Вадим on 30.08.2022.
//

import Foundation
import UIKit

class SignInView: UIView {
    
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
        label.text = "Оставь свои данные бро"
        label.font = .boldSystemFont(ofSize: 30)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let avatarImage: UIImageView = {
        let avatar = UIImageView()
        avatar.image = UIImage(named: "camera")
        avatar.layer.cornerRadius = 50
        avatar.clipsToBounds = true
        avatar.translatesAutoresizingMaskIntoConstraints = false
        avatar.isUserInteractionEnabled = true
        return avatar
    }()

    let nicknameTF: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Enter your Broname"
        textfield.layer.cornerRadius = 5
        textfield.backgroundColor = UIColor(white: 0.9, alpha: 0.8)
        textfield.textColor = .darkGray
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    let emailTF: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Bromail"
        textfield.layer.cornerRadius = 5
        textfield.backgroundColor = UIColor(white: 0.9, alpha: 0.8)
        textfield.textColor = .darkGray
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    let passwordTF: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Brossword"
        textField.layer.cornerRadius = 5
        textField.backgroundColor = UIColor(white: 0.9, alpha: 0.8)
        textField.textColor = .darkGray
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
        ])
        
        self.addSubview(nicknameTF)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
