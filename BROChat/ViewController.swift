//
//  ViewController.swift
//  BROChat
//
//  Created by Вадим on 29.07.2022.
//

import UIKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        subView()
        addConstraint()
    }

    private let topImageContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let logoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "BRO")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    private let regisrationBroButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 40
        button.clipsToBounds = false
        button.setTitle("Стать частью BRO", for: .normal)
        button.setTitle("", for: .highlighted)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        
        return button
    }()
    
    private let logInBroButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Я есть BRO", for: .normal)
        button.setTitle("", for: .highlighted)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        return button
    }()
    
    private func subView() {
        view.addSubview(logoImage)
        view.addSubview(topImageContainerView)
        view.addSubview(regisrationBroButton)
        view.addSubview(logInBroButton)
    }
    
    private func addConstraint() {
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        constraints.append(topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5))
        
        constraints.append(logoImage.leadingAnchor.constraint(equalTo: topImageContainerView.leadingAnchor))
        constraints.append(logoImage.trailingAnchor.constraint(equalTo: topImageContainerView.trailingAnchor))
        constraints.append(logoImage.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor))
        
        constraints.append(logInBroButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20))
        constraints.append(logInBroButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(logInBroButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        
        constraints.append(regisrationBroButton.bottomAnchor.constraint(equalTo: logInBroButton.topAnchor, constant: -5))
        constraints.append(regisrationBroButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(regisrationBroButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        
        
        
        NSLayoutConstraint.activate(constraints)
    }
}

extension UIColor {
    static var mainPink = UIColor(red: 227/255, green: 227/255, blue: 208/255, alpha: 1)
}
