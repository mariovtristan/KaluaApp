//
//  MenuManager.swift
//  CofeeMasters
//
//  Created by Mario Valencia on 17/02/23.
//

import Foundation
import Alamofire

// This is basically, how we will arrange the information from the API call, to have it render correctly in the menu page
//class MenuManager: ObservableObject {
//    @Published var menu: [Category] = [
//        Category(name: "Hot Coffee", products: [
//            Product(id: 0, name: "", description: "", price: 1.25, image: ""),
//            Product(id: 0, name: "", description: "", price: 1.25, image: ""),
//        ])
//    ]
//}

class MenuManager: ObservableObject {
    @Published var menu: [Category] = []
    
    //When the app starts, we want to make the api call so we have the data.
    
    init() {
        productsCall()
    }
    
    func productsCall () {
        //This line is just the API call
        AF.request("https://firtman.github.io/coffeemasters/api/menu.json")
        // Here we are specifying the data type we are receiving, and it will map the JSON file into my data model
        //So how do we pass a type as an argument? we use the type.self, in this case is [Category].self, which basically it's expecting to receive an array of categories.
            //Also, because we used .responseDecodable, we need to add the Decodable Protocol to the category struct in the Cateogries.swift file
            .responseDecodable(of: [Category].self) { response in
                //here we are just validating that we are actually getting a JSON file with information
                if let menuFromNetwork = response.value {
                    //here we are setting the information to the menu variable from the struct
                    self.menu = menuFromNetwork
//                    print(menuFromNetwork)
                }
            }
    }
}

//This is the result of the api call
//[CofeeMasters.Category(name: "HOT COFFEE", products: [CofeeMasters.Product(id: 11, name: "Black Americano", description: "Freshly pulled shots of espresso combined with hot water.", price: 1.5, image: "blackamericano.png"), CofeeMasters.Product(id: 12, name: "Cappuccino", description: "A freshly pulled shot of espresso layered with steamed whole milk and thick rich foam to offer a luxurious velvety texture and complex aroma.", price: 3.75, image: "cappuccino.png"), CofeeMasters.Product(id: 13, name: "Macchiato", description: "Our perfectly roasted coffees are blended with our powders, steamed non-fat milk and topped with thick foam to create a delicious pick-me-up treat.", price: 3.25, image: "macchiato.png"), CofeeMasters.Product(id: 14, name: "Flat White", description: "We start with an extra shot of espresso, combine them with one of our signature powders, and finished with lightly aerated milk to create the perfect, velvety espresso beverage. Available in hazelnut, vanilla, mocha or classic flat white.", price: 3.25, image: "flatwhite.png")]), CofeeMasters.Category(name: "ICED COFFEE", products: [CofeeMasters.Product(id: 21, name: "Frappuccino", description: "Non-fat milk blended with our signature powders and ice and then topped with whipped cream. A delicious non-caffeinated treat.", price: 3.75, image: "frappuccino.png"), CofeeMasters.Product(id: 22, name: "Iced Coffee", description: "Our specially brewed coffee served over ice for a refreshing and bold coffee taste", price: 3.15, image: "icedcoffee.png"), CofeeMasters.Product(id: 23, name: "Cold Brew", description: "Our signature Cold Brew Coffee is a premium blend of Bali Blue Moon and Ethiopia Yirgacheffe coffees with chicory steeped cold for 20 hours for rich, vibrant flavors.", price: 1.85, image: "coldbrew.png")]), CofeeMasters.Category(name: "TEA", products: [CofeeMasters.Product(id: 31, name: "Green Tea", description: "Like oolong and black tea, green tea comes from the plant Camellia sinensis. Green tea\'s delightfully delicate flavor is due to its minimal oxidation. It is processed to take a variety of forms, from finely ground powder to long, curling leaves. Though it originated in China, where it has been consumed for over 4,000 years, green tea is now grown in Japan and Sri Lanka, and enjoyed throughout the world.", price: 1.75, image: "greentea.png"), CofeeMasters.Product(id: 32, name: "Black Tea", description: "Like green and oolong teas, black tea comes from the Camellia sinensis plant. Its darker hue and stronger taste result from the greater level of oxidation it undergoes during processing. From delicate Darjeeling to strong Ceylon, each variety has distinct characteristics, making black tea a beloved beverage across the globe.", price: 1.75, image: "blacktea.png")]), CofeeMasters.Category(name: "SNACKS", products: [CofeeMasters.Product(id: 41, name: "Croissant", description: "Buttery, crescent-shaped French pastry", price: 2.8, image: "croissant.png"), CofeeMasters.Product(id: 42, name: "Chocolate Chip Muffin", description: "The muffins are incredibly rich, mega chocolate-y, and loaded with chocolate chips in every single bite", price: 1.75, image: "muffin.png")])]
