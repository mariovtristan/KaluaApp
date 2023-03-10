//
//  ContentView.swift
//  CofeeMasters
//
//  Created by Mario Valencia on 14/02/23.
//

import SwiftUI

struct ContentView: View {
    //This @State is pretty much useState in React
    @EnvironmentObject var orderManager: OrderManager
    
    init() {
        UITabBarItem.appearance().badgeColor = UIColor(Color("Ternary"))
    }

    
    var body: some View {
//        VStack{
//            OffersPage()
//        }
            TabView {
                MenuPage()
                    .tabItem {
                        Image(systemName: "cup.and.saucer")
                        Text("Menu")
                    }
                OffersPage()
                    .tabItem {
                        Image(systemName: "tag")
                        Text("Offers")
                    }
                OrdersPage()
                    .tabItem {
                        Image(systemName: "cart")
                        Text("Order")
                    }
                    .badge(orderManager.cart
                        .count)
                InfoPage()
                    .tabItem {
                        Image(systemName: "info.circle")
                        Text("info")
                    }
        }
    }
}

//struct TypeInfo: View {
//    @State var name = ""
//
//    var body: some View {
//        OffersPage()
//        VStack{
//            TextField("Enter your name", text: $name)
//                .padding()
//                .border(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/, width: 2)
//
//            Text("Hello \(name)")
//        }
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(MenuManager())
            .environmentObject(OrderManager())
    }
}
