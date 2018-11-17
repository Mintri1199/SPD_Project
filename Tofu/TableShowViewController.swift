//
//  TableShowViewController.swift
//  Tofu
//
//  Created by Jackson Ho on 11/16/18.
//  Copyright © 2018 Jackson Ho. All rights reserved.
//

import UIKit

class TableShowViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .backgroundBlue
        view.addSubview(contain)
        makeMainButton()
        
    }
    
    // The container View that is going to be hidden initially
    let contain: UIView = {
        let contain = UIView(frame: CGRect(x: 40, y: 50, width: 300, height: 400))
        contain.hero.id = "containerView"
        contain.backgroundColor = .gray
        return contain
    }()
    
    // The Main button that is going to be a tofu character
    let mainButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.cornerRadius = 75 * 0.5
        button.hero.id = "MainButton"
        button.addTarget(self, action: #selector(buttonUnwind), for: .touchUpInside)
        return button
    }()
    
    // Handle the initial mainButton layout constraints
    func  makeMainButton() {
        view.addSubview(mainButton)
        
        NSLayoutConstraint.activate([
            mainButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200),
            mainButton.widthAnchor.constraint(equalToConstant: 75),
            mainButton.heightAnchor.constraint(equalToConstant: 75)
            ])
    }
    
    @objc func buttonUnwind(){
        
        self.navigationController?.popToRootViewController(animated: true)
    }

}
