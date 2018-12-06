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
        makeHiddenButton()
        makeCollectionView()
        
        let vc = topMostViewController()
        collectionView.navigationController = vc.navigationController
    }
    
    let collectionView: CollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = CollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.hero.id = "containerView"
        return cv
    }()
    
    func makeCollectionView(){
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            collectionView.bottomAnchor.constraint(equalTo: mainButton.topAnchor, constant: -16),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            ])
    }

    // Hidden Map button
    let hiddenButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        button.hero.id = "MapButton"
        return button
    }()
    
    func makeHiddenButton() {
        view.addSubview(hiddenButton)
        NSLayoutConstraint.activate([
            hiddenButton.heightAnchor.constraint(equalToConstant: 0),
            hiddenButton.widthAnchor.constraint(equalToConstant: 0),
            hiddenButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200),
            hiddenButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
    }
    // The Main button that is going to be a tofu character
    let mainButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .textViewColor
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

extension UIViewController {
    func topMostViewController() -> UIViewController {
        if self.presentedViewController == nil {
            return self
        }
        if let navigation = self.presentedViewController as? UINavigationController {
            return navigation.visibleViewController!.topMostViewController()
        }
        if let tab = self.presentedViewController as? UITabBarController {
            if let selectedTab = tab.selectedViewController {
                return selectedTab.topMostViewController()
            }
            return tab.topMostViewController()
        }
        return self.presentedViewController!.topMostViewController()
    }
}

extension UIApplication {
    func topMostViewController() -> UIViewController? {
        return self.keyWindow?.rootViewController?.topMostViewController()
    }
}
