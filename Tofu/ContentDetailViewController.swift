//
//  ContentDetailViewController.swift
//  Tofu
//
//  Created by Jackson Ho on 11/17/18.
//  Copyright © 2018 Jackson Ho. All rights reserved.
//

import UIKit

class ContentDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundBlue
        
        makeMainButton()
        detailView()
    }
    
    let contentView: DetailView = {
        let contentView = DetailView()
        contentView.layer.cornerRadius = 5
        contentView.hero.id = "containerView"
        return contentView
    }()
    
    func detailView (){
        view.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            contentView.bottomAnchor.constraint(equalTo: mainButton.topAnchor, constant: -16),
            contentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            contentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            ])
    }
    
    
    let mainButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.cornerRadius = 75 * 0.5
        button.hero.id = "MainButton"
        button.addTarget(self, action: #selector(buttonUnwind), for: .touchUpInside)
        return button
    }()
    
    
    func  makeMainButton() {
        view.addSubview(mainButton)
        NSLayoutConstraint.activate([
            mainButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -36),
            mainButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            mainButton.widthAnchor.constraint(equalToConstant: 75),
            mainButton.heightAnchor.constraint(equalToConstant: 75)
            ])
    }
    
    
    @objc func buttonUnwind(){
        self.dismiss(animated: true, completion: nil)
    }
    
}
