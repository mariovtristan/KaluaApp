//
//  OffersPage.swift
//  CofeeMasters
//
//  Created by Mario Valencia on 15/02/23.
//

import SwiftUI

struct OffersPage: View {
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Offer(title: "Early Birds Coffee", description: "10% off from 5am to 9am")
                    Offer(title: "Welcome Offer", description: "20% off your first order")
                }
                .listStyle(.plain)
                .listRowSeparator(.hidden)
            }.navigationTitle("Offers")
        }
    }
}

struct OffersPage_Previews: PreviewProvider {
    static var previews: some View {
        OffersPage()
    }
}
