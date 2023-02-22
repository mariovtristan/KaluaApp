//
//  DetailsPage.swift
//  CofeeMasters
//
//  Created by Mario Valencia on 17/02/23.
//

import SwiftUI

struct DetailsPage: View {
    
    @State var quantity: Int = 1
    //We are creating this product variable, to bring the properties from the menu page to this page, so each product can render with the correct detailed information.
    var product: Product
    @EnvironmentObject var orderManager: OrderManager
    //This variable is for letting us go back to the homepage after clicking the add to cart, and we call it after the action we want, so it will be called in the add to cart buttn
    @Environment(\.dismiss) var dismiss

    //This is for chaging the stepper colors
    init(product: Product) {
        UIStepper.appearance().setDecrementImage(UIImage(systemName: "minus"), for: .normal)
        UIStepper.appearance().setIncrementImage(UIImage(systemName: "plus"), for: .normal)
        self.product = product
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Text(product.name)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color("Secondary"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                AsyncImage(url: product.imageUrl)
                    .cornerRadius(5)
                    .padding()
                    .frame(maxWidth: .infinity, idealHeight: 150, maxHeight: 150)
                    .padding(.top, 32)
                Text(product.description)
                    .font(.callout)
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.leading)
                    .padding(24)
                HStack {
                    Text("$\(product.price, specifier: "%.2f")")
                        .frame(maxWidth: 50)
                        .padding(.leading, 35)
                    Stepper(value: $quantity, in: 1...10) {}
                    
                }
                .padding(30)
                
                Text("Subtotal $\(Double(quantity)*product.price, specifier: "%.2f")")
                    .bold()
                    .padding()
                
                Button("Add \(quantity) to Cart") {
                    orderManager.addToCart(product: product, quantity: quantity)
                    dismiss()
                    print(orderManager.cart)
                }
                .padding()
                .frame(width: 200)
                .font(.system(size: 18, weight: Font.Weight.semibold))
                .foregroundColor(Color("Alternative2"))
                .background(Color("Alternative1"))
                .cornerRadius(25)
            }
        }
        .background(Color("Alternative2"))
    }
}

struct DetailsPage_Previews: PreviewProvider {
    static var previews: some View {
        DetailsPage(product: Product(id: 1, name: "Dummy", description: "", price: 1.25, image: ""))
            .environmentObject(OrderManager())
    }
}
