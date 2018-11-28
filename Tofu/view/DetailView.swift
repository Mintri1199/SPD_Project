//
//  DetailView.swift
//  Tofu
//
//  Created by Jackson Ho on 11/17/18.
//  Copyright © 2018 Jackson Ho. All rights reserved.
//

import UIKit
import MapKit

class DetailView: UIView {
    let textView = UITextView()
    var imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = .backgroundBlue
        makeStackView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeStackView () {
        let data = DataObject.dataArray[row]
        let stackView = UIStackView(arrangedSubviews: [imageView, textView])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        imageView.image = UIImage(named: data.imageName)
        imageView.contentMode = .scaleToFill
        
        textView.textAlignment = .left
        textView.isScrollEnabled = true
        textView.showsVerticalScrollIndicator = true
        textView.isUserInteractionEnabled = true
        textView.isEditable = false
        textView.layer.cornerRadius = 10
        textView.text = data.description
        textView.textColor = .textColor
        textView.backgroundColor = .textViewColor
        textView.font = UIFont.init(name: "Helvetica", size: 20)
        
        print(data.coordinate)
    
        
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            ])
        
    }
    
}
