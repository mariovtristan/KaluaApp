//
//  Item.swift
//  CofeeMasters
//
//  Created by Mario Valencia on 16/02/23.
//

import SwiftUI

struct ProductItem: View {
    
    //This Product with capital P, is my struct from the Model file, it's basically bringing that struct into this file so I can access its variables.
    var product: Product
    
    var body: some View {
        VStack {
            AsyncImage(url: product.imageUrl)
                .frame(width: 300, height: 150)
                .background(Color("AccentColor"))
            HStack {
                VStack (alignment: .leading) {
                    Text("\(product.name)")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color("Primary"))
                    
                    Text("$ \(product.price)")
                        .font(.caption)
                        .foregroundColor(Color("Alternative2"))
                }
                .padding(8)
                Spacer()
            }
        }
        .background(Color("Secondary"))
        .cornerRadius(10)
        .padding(.trailing)
    }
}

struct ProductItem_Previews: PreviewProvider {
    static var previews: some View {
        ProductItem(product: Product(id: 1, name: "BlackCoffee", description: "", price: 1.25, image: ""))
    }
}
