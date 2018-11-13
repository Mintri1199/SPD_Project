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
    
    func mainButtonLayout(){
        view.addSubview(mainButton)
        NSLayoutConstraint.activate([
            mainButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            mainButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            mainButton.widthAnchor.constraint(equalToConstant: 150),
            mainButton.heightAnchor.constraint(equalToConstant: 150),
            ])
    }
    
    @objc func mainButtonTapped(sender: UIButton){
        if mainButton.layer.cornerRadius == 150.0 * 0.5{
            print("The button has shrink")
            UIView.animate(withDuration: 0.5) {
                self.mainButton.layer.cornerRadius = 75 * 0.5
            }
        }else{
            print("The button has expanded")
            UIView.animate(withDuration: 0.5) {
                self.mainButton.layer.cornerRadius = 150 * 0.5
            }
        }
    }
}

