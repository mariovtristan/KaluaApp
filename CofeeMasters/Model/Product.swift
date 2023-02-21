//
//  Product.swift
//  CofeeMasters
//
//  Created by Mario Valencia on 17/02/23.
//

import Foundation

//because Categories (Category) has an array of products, we also need to the decode products
// We use the Decodable keyword, which is a protocol to automatically convert the information to a JSON file. Meaning that it can be decoded into JSON
struct Product: Decodable, Identifiable {
    var id: Int
    var name: String
    var description: String
    var price: Double
    var image: String
    
    var imageUrl: URL {
        URL(string: "https://firtman.github.io/coffeemasters/api/images/\(self.image)")!
    }
}
