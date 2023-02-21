//
//  OrderManager.swift
//  CofeeMasters
//
//  Created by Mario Valencia on 17/02/23.
//

import Foundation

class OrderManager: ObservableObject {
    //Here my variable cart, is an array of tupples. It contains the Product information on one side, and the number of items of product in the other
    @Published var cart: [(Product, Int)] = [(Product(id: 1, name: "BlackCoffee", description: "", price: 1.25, image: ""), 5), (Product(id: 2, name: "Chai", description: "", price: 1.25, image: ""), 5), (Product(id: 3, name: "tea", description: "", price: 1.25, image: ""), 5)]
}
