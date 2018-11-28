//
//  ContentDetailViewController.swift
//  Tofu
//
//  Created by Jackson Ho on 11/17/18.
//  Copyright © 2018 Jackson Ho. All rights reserved.
//

import UIKit
import MapKit
class ContentDetailViewController: UIViewController {
    
    var coordinate: CLLocationCoordinate2D?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundBlue

        makeMainButton()
        detailView()
        makeMapButton()
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
        button.layer.cornerRadius = 60 * 0.5
        button.backgroundColor = .textViewColor
        button.hero.id = "MainButton"
        button.addTarget(self, action: #selector(buttonUnwind), for: .touchUpInside)
        return button
    }()
    
    
    func  makeMainButton() {
        view.addSubview(mainButton)
        NSLayoutConstraint.activate([
            mainButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -36),
            mainButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            mainButton.widthAnchor.constraint(equalToConstant: 60),
            mainButton.heightAnchor.constraint(equalToConstant: 60)
            ])
    }
    
    let mapButton: UIButton = {
        let button = UIButton()
        button.setTitle("Get Direction", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .textViewColor
        button.hero.id = "MapButton"
        button.setTitleColor(.textColor, for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 20)
        button.addTarget(self, action: #selector(mapButtonTapped), for: .touchUpInside)
        return button
    }()
    
    func makeMapButton(){
        view.addSubview(mapButton)
        mapButton.layer.cornerRadius = 10
        NSLayoutConstraint.activate([
            mapButton.widthAnchor.constraint(equalToConstant: 160),
            mapButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mapButton.topAnchor.constraint(equalTo: mainButton.topAnchor),
            mapButton.bottomAnchor.constraint(equalTo: mainButton.bottomAnchor),
            mapButton.trailingAnchor.constraint(lessThanOrEqualTo: mainButton.leadingAnchor, constant: 16)
            ])
    }
    
    
    @objc func mapButtonTapped(){
        guard let location = coordinate else {
            return print("There are no coordinate")
        }
        
        let regionSpan = MKCoordinateSpan(latitudeDelta: location.latitude, longitudeDelta: location.longitude)
        
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinateSpan: regionSpan), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan)]
        
        let placeMark = MKPlacemark(coordinate: location)
        let mapItems = MKMapItem(placemark: placeMark)
        mapItems.name = DataObject.dataArray[row].name
        
        mapItems.openInMaps(launchOptions: options)
        print(location)
        
    }
    
    @objc func buttonUnwind(){
        navigationController?.popViewController(animated: true)
    }
    
}
