//
//  CofeeMastersApp.swift
//  CofeeMasters
//
//  Created by Mario Valencia on 14/02/23.
//

import SwiftUI

@main
struct CofeeMastersApp: App {
    var menuManager = MenuManager() // Here we are creating 
    var orderManager = OrderManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(menuManager)
                .environmentObject(orderManager)
        }
    }
}
