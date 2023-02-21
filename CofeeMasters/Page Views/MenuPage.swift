//
//  MenuPage.swift
//  CofeeMasters
//
//  Created by Mario Valencia on 16/02/23.
//

import SwiftUI

struct MenuPage: View {
    @EnvironmentObject var menuManager: MenuManager
    
    var body: some View {
            NavigationView {
                List {
                    //We are looping through the array of categories, that also contain an array of products
                    ForEach(menuManager.menu) { category in
                        //here we are just displaying the name of the category
                        Text(category.name)
                        
                        ForEach(category.products) {item in
                            NavigationLink {
                                DetailsPage()
                            } label: {
                                ProductItem(product: item)
                                //this is how the label looked prior to importing the data with the Api
    //                            ProductItem(product: Product(id: 1, name: "BlackCoffee", description: "", price: 1.25, image: ""))
                            }
                        }
                    }
                    .listRowBackground(Color("Background"))
                    .listRowSeparatorTint(.clear)
                }
                .navigationTitle("Menu")
            }

    }
}

struct MenuPage_Previews: PreviewProvider {
    static var previews: some View {
        MenuPage()
            .environmentObject(MenuManager())
    }
}
