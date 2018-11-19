//
//  ContainerView.swift
//  Tofu
//
//  Created by Jackson Ho on 11/13/18.
//  Copyright © 2018 Jackson Ho. All rights reserved.
//

import UIKit
import CoreLocation

var row = 0

// Custom UIview that will have a table view inside it
class ContainerView: UIView{
    let tableView = ContentTableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .lightGray
        layer.cornerRadius = 5
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
    let names = ["Golden Gate Bridge", "Golden Gate Park" , "The Exploratorium"]
    let descriptions = [
            "The Golden Gate Bridge's vaulting, orange arches amidst the rocky seascape of the San Francisco Bay have made it one of the West Coast's most enduring symbols and the city's most popular tourist attraction. The bridge's name, Golden Gate, actually refers to the body of water it spans (the Golden Gate Strait that connects the Pacific Ocean with the San Francisco Bay), and was built to make travel between San Francisco and Marin County an easier feat. ",
            "The park offers so much to see and do, it could take an entire day to experience all that it has to offer. Trails, picturesque picnic spaces, playgrounds, sports courts, gardens, museums and more can be found within its evergreen borders. ",
            "This museum, or as it refers to itself, a learning laboratory, features 600 hands-on exhibits that cover a plethora of subject matter, such as engineering, psychology, geography and biology. "
    ]
    let coordinates = [CLLocationCoordinate2D(latitude: 37.8199, longitude: 122.4783),
                       CLLocationCoordinate2D(latitude: 37.76904, longitude: -122.483519),
                       CLLocationCoordinate2D(latitude: 37.801542, longitude: -122.3996727)]
    
    func makeDataArray() -> [DataEntry]{
        var listOfData = [DataEntry]()
        for i in 0 ... 2 {
            let dateEntry = DataEntry.init(name: names[i], description: descriptions[i], coordinate: coordinates[i])
            listOfData.append(dateEntry)
        }
        return listOfData
    }
    
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        translatesAutoresizingMaskIntoConstraints = false
        dataSource = self
        delegate = self
        separatorStyle = .none
        backgroundColor = .clear
        register(ContentCell.self, forCellReuseIdentifier: cellId)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return makeDataArray().count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ContentCell
        let listOfData = makeDataArray()
        
        DataObject.addData(data: listOfData[indexPath.row])
        
        cell.contentLabel.text = DataObject.dataArray[indexPath.row].name
        
        return cell
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        row = indexPath.row
        window?.rootViewController?.present(ContentDetailViewController(), animated: true, completion: nil)
        
        
    }
}
