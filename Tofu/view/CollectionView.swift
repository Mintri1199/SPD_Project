//
//  CollectionView.swift
//  Tofu
//
//  Created by Jackson Ho on 11/27/18.
//  Copyright © 2018 Jackson Ho. All rights reserved.
//

import UIKit
import MapKit

var row = 0
class CollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    let collectionCellId = "collectionCell"
    
    // Mock Data
    let cellId = "cellId"
    let names = ["Golden Gate Bridge", "Golden Gate Park" , "The Exploratorium"]
    let imageNames = ["goldenBridge","goldenGatePark","theExploratorium"]
    let descriptions = [
        "The Golden Gate Bridge's vaulting, orange arches amidst the rocky seascape of the San Francisco Bay have made it one of the West Coast's most enduring symbols and the city's most popular tourist attraction. The bridge's name, Golden Gate, actually refers to the body of water it spans (the Golden Gate Strait that connects the Pacific Ocean with the San Francisco Bay), and was built to make travel between San Francisco and Marin County an easier feat. ",
        "The park offers so much to see and do, it could take an entire day to experience all that it has to offer. Trails, picturesque picnic spaces, playgrounds, sports courts, gardens, museums and more can be found within its evergreen borders. ",
        "This museum, or as it refers to itself, a learning laboratory, features 600 hands-on exhibits that cover a plethora of subject matter, such as engineering, psychology, geography and biology. "
    ]
    let coordinates = [CLLocationCoordinate2D(latitude: 37.8199, longitude: 122.4783),
                       CLLocationCoordinate2D(latitude: 37.76904, longitude: -122.483519),
                       CLLocationCoordinate2D(latitude: 37.801542, longitude: -122.3996727)]
    
    
    var listOfData = [DataEntry]()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        backgroundColor = .containerColor
        isScrollEnabled = true
        register(CollectionViewCell.self, forCellWithReuseIdentifier: collectionCellId)
        delegate = self
        dataSource = self
        
        listOfData = makeDataArray()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeDataArray() -> [DataEntry]{
        var listOfData = [DataEntry]()
        for i in 0 ... 2 {
            let dateEntry = DataEntry.init(name: names[i], description: descriptions[i], imageName: imageNames[i], coordinate: coordinates[i])
            listOfData.append(dateEntry)
        }
        return listOfData
    }
    
    // Determine the number of cell to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listOfData.count    }
    
    // Define the cell to use
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: collectionCellId, for: indexPath) as! CollectionViewCell
        let listOfData = makeDataArray()
        let data = listOfData[indexPath.row]
        DataObject.addData(data: data)
        cell.nameLabel.text = data.name
        return cell
    }
    
    // Set the size of the collectionViewCell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: bounds.width/1.15, height: bounds.width/4)
    }
    
    // What happen when a cell is selected
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = cellForItem(at: indexPath)
        cell?.backgroundColor = .white
        row = indexPath.row
        let nextVC = ContentDetailViewController()
        nextVC.coordinate = DataObject.dataArray[row].coordinate
        print(row)
        window?.rootViewController?.present(nextVC, animated: true, completion: nil)
    }
    
    // What happen when the cell is not selected
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = cellForItem(at: indexPath)
        
        cell?.backgroundColor = .collectionCellColor
    }
    
    // Spacing between each cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}
