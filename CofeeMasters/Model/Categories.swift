//
//  Categories.swift
//  CofeeMasters
//
//  Created by Mario Valencia on 17/02/23.
//

import Foundation

// We use the Decodable keyword, which is a protocol to automatically convert the information to a JSON file. Meaning that it can be decoded into JSON
//We also had to add the Identifiable protocol, because when we were looping in our for each in the MenuPage file, we were getting an error that said, that for us to initialize, we needed the categories to be identifiable, this is why we ended putting the keyword in this struct.
struct Category: Decodable, Identifiable {
    var name: String
    var products: [Product] = []
    //What we are doing here with this id, its because there is no id for the categories, for them to be identifiable we need to add them. So we could generate a random id, or we can do what we did down here, which is setting the id for the name of the category. In this case, there can't be two categories with the same name.
    var id: String {
        return self.name
    }
}
