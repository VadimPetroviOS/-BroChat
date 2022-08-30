//
//  WelcomeView.swift
//  BROChat
//
//  Created by Вадим on 08.08.2022.
//

import Foundation
import UIKit

protocol WelcomeViewControllerDelegate: AnyObject {
    func signUp()
    func logIn()
}

class WelcomeView: UIView {
    
    weak var delegate: WelcomeViewControllerDelegate?
    
    private let logoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "BRO")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    let welcomeLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let signUpBroButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 40
        button.clipsToBounds = false
        button.setTitle("Стать частью BRO", for: .normal)
        button.setTitle("", for: .highlighted)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        
        return button
    }()
    
    private let logInBroButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Я есть BRO", for: .normal)
        button.setTitle("", for: .highlighted)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(logIn), for: .touchUpInside)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        setConstraints()
    }
    
    private func setConstraints() {
        
        let stackView: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [signUpBroButton, logInBroButton])
            stack.axis = .vertical
            stack.spacing = 20
            stack.alignment = .center
            stack.distribution = .fillEqually
            stack.translatesAutoresizingMaskIntoConstraints = false
        
            return stack
        }()
        
        let stack = UIStackView(arrangedSubviews: [logoImage, welcomeLabel, stackView])
        stack.axis = .vertical
        stack.spacing = 20
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stack)
        
        NSLayoutConstraint.activate([
            
            stack.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            stack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: WelcomeViewConstants.insets),
            stack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -WelcomeViewConstants.insets),
            stack.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -WelcomeViewConstants.insets*2),
            
            logoImage.widthAnchor.constraint(equalToConstant: WelcomeViewConstants.imageSize),
            logoImage.heightAnchor.constraint(equalToConstant: WelcomeViewConstants.imageSize),
            
            stackView.bottomAnchor.constraint(equalTo: stack.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: stack.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: stack.trailingAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 50),
            
        ])
    }
    
    @objc private func signUp() {
        delegate?.signUp()
    }

    @objc private func logIn() {
        delegate?.logIn()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
}

private struct WelcomeViewConstants {
    static let insets: CGFloat = 20
    static let imageSize: CGFloat = 350
}
