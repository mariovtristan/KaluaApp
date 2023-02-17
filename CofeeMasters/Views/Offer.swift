//
//  Offer.swift
//  CofeeMasters
//
//  Created by Mario Valencia on 14/02/23.
//

import SwiftUI

struct Offer: View {
    var title: String = ""
    var description: String = ""
    
    var body: some View {
        ZStack {
            Image("coffeeBackground")
                .frame(maxWidth: .infinity, maxHeight: 300)
                .clipped()
            VStack (alignment: .center, spacing: 50) {
                VStack {
                    Text(title)
                        .padding()
                        .font(.title)
                        .background(Color("Alternative2"))
                        .padding(.bottom, 20)
                    Text(description)
                        .padding()
                        .background(Color("Alternative2"))
                }
                .frame(maxWidth: .infinity, minHeight: 150, maxHeight: 150, alignment: .center)
            }
        }.background(Color(.white))
    }
}

struct Offer_Previews: PreviewProvider {
    static var previews: some View {
        Offer(title: "My offer", description: "this is a description")
            .previewLayout(.fixed(width: 350, height: 200))
            
    }
}
