//
//  ContainerView.swift
//  Tofu
//
//  Created by Jackson Ho on 11/13/18.
//  Copyright © 2018 Jackson Ho. All rights reserved.
//

import UIKit

// Custom UIview that will have a table view inside it
class ContainerView: UIView{
    let tableView = ContentTableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .lightGray
        
        addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class ContentTableView: UITableView , UITableViewDelegate, UITableViewDataSource {
    
    let cellId = "cellId"
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        translatesAutoresizingMaskIntoConstraints = false
        dataSource = self
        delegate = self
        separatorStyle = .none
        backgroundColor = .clear
        register(ContentCell.self, forCellReuseIdentifier: cellId)
        //separatorStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ContentCell
        return cell
    }
}
