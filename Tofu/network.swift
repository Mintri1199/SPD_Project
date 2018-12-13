////
////  network.swift
////  Tofu
////
////  Created by Jackson Ho on 12/5/18.
////  Copyright © 2018 Jackson Ho. All rights reserved.
////
//
//import Foundation
//
//// Make a user struct for data handling
//struct User: Codable {
//    var userId: Int
//    var id: Int
//    var title: String
//    var completed: Bool
//}
//
//extension User{
//    // Custom Keys (What does custom keys even mean?)
//    enum CodingKeys: String, CodingKey {
//        case userId
//        case id = "serviceId" // Custom keys
//        case title = "titleKey" // Custom keys
//        case completed
//    }
//}
//
//func network() {
//    guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else {return}
//    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//        guard let dataResponse = data, error == nil else {
//            print(error?.localizedDescription ?? "Response Error")
//            return }
//        do{
//            //here dataResponse received from a network request
//            let decoder = JSONDecoder()
//            let model = try decoder.decode(User.self, from: dataResponse) // Decode JSON Response Data
//            print(model)
//        } catch let parsingError {
//            print("Error", parsingError)
//        }
//    }
//    task.resume()
//}
//
//
//
//
//
//
