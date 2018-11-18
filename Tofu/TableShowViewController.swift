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
        makeMainButton()
        makeContainerView()
    }
    
    // The container View that is going to be hidden initially
    let contain: ContainerView = {
        let contain = ContainerView()
        contain.translatesAutoresizingMaskIntoConstraints = false
        contain.hero.id = "containerView"
        return contain
    }()
    
    func makeContainerView() {
        view.addSubview(contain)
        NSLayoutConstraint.activate([
            contain.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            contain.bottomAnchor.constraint(equalTo: mainButton.topAnchor, constant: -16),
            contain.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            contain.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            ])
    }
    
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
            mainButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 300),
            mainButton.widthAnchor.constraint(equalToConstant: 75),
            mainButton.heightAnchor.constraint(equalToConstant: 75)
            ])
    }
    
    @objc func buttonUnwind(){
        
        self.navigationController?.popToRootViewController(animated: true)
    }

}
