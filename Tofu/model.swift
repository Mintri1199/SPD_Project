//
//  model.swift
//  Tofu
//
//  Created by Jackson Ho on 11/17/18.
//  Copyright © 2018 Jackson Ho. All rights reserved.
//

import Foundation
import CoreLocation

struct DataEntry {
    var name: String
    var description: String
    var imageName: String
    var coordinate: CLLocationCoordinate2D
}

func getPlaces() {
    guard let url = URL(string: "https://spd-place.herokuapp.com/37.801542,-122.3996727") else {return}
    
    let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
        guard let dataResponse = data, error == nil else {print(error?.localizedDescription ?? "Response Error")
            return}
        do {
            let jsonResponse = try JSONSerialization.jsonObject(with: dataResponse, options: [])
            
            print(jsonResponse)
            
        }catch{
            print("error")
        }
    }
    task.resume()
}
