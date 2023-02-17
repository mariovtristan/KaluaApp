//
//  DetailsPage.swift
//  CofeeMasters
//
//  Created by Mario Valencia on 17/02/23.
//

import SwiftUI

struct DetailsPage: View {
    @State var quantity: Int = 1
    
    init() { UIStepper.appearance().setDecrementImage(UIImage(systemName: "minus"), for: .normal)
        UIStepper.appearance().setIncrementImage(UIImage(systemName: "plus"), for: .normal)
    }
    var body: some View {
        ScrollView {
            VStack {
                Image("BlackCoffee")
                    .cornerRadius(5)
                    .padding()
                    .frame(maxWidth: .infinity, idealHeight: 150, maxHeight: 150)
                    .padding(.top, 32)
                Text("Freshly pulled shots of espresso combined with hot water")
                    .font(.callout)
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.leading)
                    .padding(24)
                HStack {
                    Text("$ 1.50")
                        .frame(maxWidth: 50)
                        .padding(.leading, 35)
                    Stepper(value: $quantity, in: 1...10) {}
                    
                }
                .padding(30)
                
                Text("Subtotal $ 1.50")
                    .bold()
                    .padding()
                
                Button("Add \(quantity) to Cart") {
                    print("Button Tapped")
                }
                .padding()
                .frame(width: 200)
                .font(.system(size: 18, weight: Font.Weight.semibold))
                .foregroundColor(Color("Alternative2"))
                .background(Color("Alternative1"))
                .cornerRadius(25)
            }
        }
    }
}

struct DetailsPage_Previews: PreviewProvider {
    static var previews: some View {
        DetailsPage()
    }
}
