//
//  ContentCell.swift
//  Tofu
//
//  Created by Jackson Ho on 11/17/18.
//  Copyright © 2018 Jackson Ho. All rights reserved.
//

import UIKit
// Custom tableCell 
class ContentCell: UITableViewCell {
    let contentLabel = UILabel()
    let contentCard = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        
        
        addSubview(contentCard)
        contentCard.translatesAutoresizingMaskIntoConstraints = false
        contentCard.layer.cornerRadius = 10
        contentCard.backgroundColor = .yellow
        addSubview(contentLabel)
        contentLabel.text = "Test asdfjkhasdlfjkbhakfvbalkcnv asdhvbnlkjcfvyn8asdjhfajsd;lajksdv;ahjkjv;aksjnfvsgjsfcnadshjflsknx"
        contentLabel.textColor = .black
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        contentLabel.numberOfLines = 0
        NSLayoutConstraint.activate([
            contentCard.topAnchor.constraint(equalTo: contentLabel.topAnchor, constant: -10),
            contentCard.bottomAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: 10),
            contentCard.leadingAnchor.constraint(equalTo: contentLabel.leadingAnchor, constant: -10),
            contentCard.trailingAnchor.constraint(equalTo: contentLabel.trailingAnchor, constant: 10),
            contentLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            contentLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            contentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            contentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
