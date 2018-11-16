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
    var containerWidthContraint: NSLayoutConstraint!
    var containerHeightConstaint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundBlue
        mainButtonLayout()
        container()
    }
    
    
    //Testing Creating a UIview that will contain a UITableView
//    let containterView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        let container = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        container.backgroundColor = .white
//        return container
//    }()
    
    let contain: UIView = {
        let contain = UIView()
        contain.translatesAutoresizingMaskIntoConstraints = false
        contain.backgroundColor = .red
        return contain
    }()
    func container() {
        view.addSubview(contain)

        containerWidthContraint = contain.widthAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.widthAnchor)
        containerHeightConstaint = contain.heightAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.heightAnchor)
        
        NSLayoutConstraint.activate([
            containerHeightConstaint, containerWidthContraint,
            contain.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contain.topAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor),
            contain.bottomAnchor.constraint(equalTo: mainButton.topAnchor),
            contain.bottomAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 200),
            contain.leadingAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.leadingAnchor),
            contain.trailingAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor)
            ])
        
        }
    
//    func makeContainerView(){
//        view.addSubview(containterView)
//        let point = CGPoint(x: view.safeAreaInsets.top * 0.5, y: view.safeAreaInsets.top + 25)
//        let size = CGSize(width: view.frame.width - view.safeAreaInsets.top, height: view.frame.height - ((view.safeAreaInsets.bottom * 2) + (mainButton.frame.height * 2) + 20))
//        containterView.frame = CGRect(origin: point, size: size)
//    }
    
    // The Main button that is going to be a tofu character
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
        
        NSLayoutConstraint.activate([
            mainButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            mainButtonYConstraint,
            mainButtonHeightConstraint,
            mainButtonWidthConstraint
            ])
    }
    
    func shrinkMainButton(){
        mainButtonYConstraint.constant = 250
        mainButtonHeightConstraint.constant = 100
        mainButtonWidthConstraint.constant = 100
        mainButton.layer.cornerRadius = mainButtonHeightConstraint.constant * 0.5
    }
    
    func enlargeMainButton(){
        mainButtonYConstraint.constant = 0
        mainButtonHeightConstraint.constant = 150
        mainButtonWidthConstraint.constant = 150
        mainButton.layer.cornerRadius = 75 * 0.5
    }
    
    // Handle the animation of the button when tap
    @objc func mainButtonTapped(sender: UIButton){
        
        if mainButtonYConstraint.constant == 0{
            shrinkMainButton()
            UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
            }
        }else{
            enlargeMainButton()
            UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    
    
}

