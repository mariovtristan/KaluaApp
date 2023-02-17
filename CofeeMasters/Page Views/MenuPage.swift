//
//  MenuPage.swift
//  CofeeMasters
//
//  Created by Mario Valencia on 16/02/23.
//

import SwiftUI

struct MenuPage: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<5) { item in
                    NavigationLink {
                        DetailsPage()
                    } label: {
                        ProductItem(product: Product(id: 1, name: "BlackCoffee", description: "", price: 1.25, image: ""))
                    }
                }
            }
            .navigationTitle("Menu")
        }
        
    }
}

struct MenuPage_Previews: PreviewProvider {
    static var previews: some View {
        MenuPage()
    }
}
