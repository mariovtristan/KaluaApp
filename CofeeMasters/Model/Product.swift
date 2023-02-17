//
//  Product.swift
//  CofeeMasters
//
//  Created by Mario Valencia on 17/02/23.
//

import Foundation

struct Product {
    var id: Int
    var name: String
    var description: String
    var price: Double
    var image: String
    
    var imageUrl: URL {
        URL(string: "https://firtman.github.io/coffeemasters/api/images/\(self.image)")!
    }
}
