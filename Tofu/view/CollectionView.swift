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
    var navigationController : UINavigationController!
    let cellId = "cellId"
    var listOfData = [DataEntry]()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        showsVerticalScrollIndicator = false 
        backgroundColor = .containerColor
        isScrollEnabled = true
        register(CollectionViewCell.self, forCellWithReuseIdentifier: collectionCellId)
        delegate = self
        dataSource = self
        layer.cornerRadius = 10
        listOfData = makeDataArray()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeDataArray() -> [DataEntry]{
        var listOfData = [DataEntry]()
        for i in 0 ... names.count - 1 {
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
        return CGSize(width: bounds.width/1.15, height: bounds.width/3)
    }
    
    // What happen when a cell is selected
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = cellForItem(at: indexPath) as! CollectionViewCell
        cell.backgroundColor = .collectionCellColor
        row = indexPath.row
        let nextVC = ContentDetailViewController()
        nextVC.coordinate = DataObject.dataArray[row].coordinate
        print(row)
        navigationController.pushViewController(nextVC, animated: true)
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
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
}
