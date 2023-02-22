//
//  OrderItem.swift
//  CofeeMasters
//
//  Created by Mario Valencia on 20/02/23.
//

import SwiftUI

struct OrderItem: View {
    var item: (Product, Int)
    @EnvironmentObject var orderManager: OrderManager
    
    var body: some View {
        HStack {
            Text("\(item.1)x")
            Text(item.0.name)
            Spacer()
            Text("\(Double(item.1)*item.0.price, specifier: "%.2f")")
            Image(systemName: "trash")
                .font(.title2)
                .foregroundColor(Color("Ternary"))
                .padding(.leading)
                .onTapGesture {
                    orderManager.removeProduct(product: item.0)
                }
        }
    }
}

struct OrderItem_Previews: PreviewProvider {
    static var previews: some View {
        OrderItem(item: (Product(id: 1, name: "Dummy", description: "", price: 1.25, image: ""), 6))
    }
}
