//
//  ViewController.swift
//  Tofu
//
//  Created by Jackson Ho on 11/12/18.
//  Copyright © 2018 Jackson Ho. All rights reserved.
//

import UIKit
import Hero

extension UIColor{
    static var backgroundBlue = UIColor(red: 0/255, green: 153/255, blue: 204/255, alpha: 1)
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .backgroundBlue
        makeMainButton()
        view.hero.id = "mainViewController"
        view.addSubview(contain)
    }
    // The container View that is going to be hidden initially
    let contain: UIView = {
        let contain = UIView(frame: CGRect(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/2, width: 0, height: 0))
        contain.hero.id = "containerView"
        contain.backgroundColor = .gray
        return contain
    }()

    // The Main button that is going to be a tofu character
    let mainButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.cornerRadius = CGFloat(75 * 0.5)
        button.hero.id = "MainButton"
        button.addTarget(self, action: #selector(mainButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // Handle the initial mainButton layout constraints
    func  makeMainButton() {
        view.addSubview(mainButton)
        
        NSLayoutConstraint.activate([
            mainButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            mainButton.widthAnchor.constraint(equalToConstant: 150),
            mainButton.heightAnchor.constraint(equalToConstant: 150)
            ])
    }

    // Handle the animation of the button when tap
    @objc func mainButtonTapped(){
        
        self.navigationController?.pushViewController(TableShowViewController(), animated: true)
    }
}

