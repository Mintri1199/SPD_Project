//
//  DataObject.swift
//  Tofu
//
//  Created by Jackson Ho on 11/19/18.
//  In collaboration with Zurich Okoren
//  Copyright © 2018 Jackson Ho. All rights reserved.
//

import UIKit

// This singleton is what going to transfer the data from tableView to Detail view
class DataObject: NSObject {
    
    static var dataArray = [DataEntry]()

    class func addData (data: DataEntry){
        DataObject.dataArray.append(data)
    }
    
    class func removeData(atIndex: Int){
        DataObject.dataArray.remove(at: atIndex)
    }
    
}
