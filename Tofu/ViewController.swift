//
//  ViewController.swift
//  Tofu
//
//  Created by Jackson Ho on 11/12/18.
//  Copyright © 2018 Jackson Ho. All rights reserved.
//

import UIKit

extension UIColor{
    static var backgroundBlue = UIColor(red: 0/255, green: 153/255, blue: 204/255, alpha: 1)
}


class ViewController: UIViewController {
    var mainButtonYConstraint: NSLayoutConstraint!
    var mainButtonHeightConstraint: NSLayoutConstraint!
    var mainButtonWidthConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundBlue
        mainButtonLayout()
    }
    
    
    let mainButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.cornerRadius = CGFloat(75 * 0.5)
        button.addTarget(self, action: #selector(mainButtonTapped(sender:)), for: .touchUpInside)
        return button
    }()
    
    // Handle the initial mainButton layout constraints
    func mainButtonLayout(){
        view.addSubview(mainButton)
        
        mainButtonYConstraint = mainButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        mainButtonWidthConstraint = mainButton.widthAnchor.constraint(equalToConstant: 150)
        mainButtonHeightConstraint =  mainButton.heightAnchor.constraint(equalToConstant: 150)
        
        NSLayoutConstraint.activate([mainButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                                     mainButtonYConstraint,
                                     mainButtonHeightConstraint,
                                     mainButtonWidthConstraint
                                    ])
    }
    
    // Handle the animation of the button when tap
    @objc func mainButtonTapped(sender: UIButton){
        if mainButtonYConstraint.constant == 0{
            mainButtonYConstraint.constant = 250
            mainButtonHeightConstraint.constant = 100
            mainButtonWidthConstraint.constant = 100
            mainButton.layer.cornerRadius = mainButtonHeightConstraint.constant * 0.5
            UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
            }
        }else{
            mainButtonYConstraint.constant = 0
            mainButtonHeightConstraint.constant = 150
            mainButtonWidthConstraint.constant = 150
            mainButton.layer.cornerRadius = 75 * 0.5
            UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
            }
        }
    }
}

