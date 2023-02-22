//
//  OrderManager.swift
//  CofeeMasters
//
//  Created by Mario Valencia on 17/02/23.
//

import Foundation

class OrderManager: ObservableObject {
    //Here my variable cart, is an array of tupples. It contains the Product information on one side, and the number of items of product in the other. This was before calling the api
//    @Published var cart: [(Product, Int)] = [(Product(id: 1, name: "BlackCoffee", description: "", price: 1.25, image: ""), 5), (Product(id: 2, name: "Chai", description: "", price: 1.25, image: ""), 5), (Product(id: 3, name: "tea", description: "", price: 1.25, image: ""), 5)]
    
    @Published var cart: [(Product, Int)] = []
    
    func addToCart (product: Product, quantity: Int){
        self.cart.append((product, quantity))
    }
    
    func removeProduct (product: Product) {
        //The removeAll has an optional argument which is a closure, that returns a Boolean.
        self.cart.removeAll { itemInCart in
            //because itemInCart is a tupple of a product and the quantity, we access the product with .0 and we say if it matches the product id we are receiving as the argument, it will get deleted from the array
            return itemInCart.0.id == product.id
        }
    }
    
    func calculateTotal () -> Double {
        var total: Double = 0;
        for item in cart {
            total += item.0.price * Double(item.1)
        }
        return total
    }
}
