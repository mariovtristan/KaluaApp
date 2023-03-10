//
//  CartPage.swift
//  CofeeMasters
//
//  Created by Mario Valencia on 16/02/23.
//

import SwiftUI

struct OrdersPage: View {
    //Bring the singleton that was inject in the App. (these are the menuManager and cartManager from the coffeeMastersApp file
    @EnvironmentObject var orderManager: OrderManager
    @State var name: String = ""
    @State var phone: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Alternative2")
                    .ignoresSafeArea()
                if orderManager.cart.count == 0 {
                    Text("Your order is empty")
                } else {
                    List {
                        // A section is another container view
                        Section ("ITEMS"){
                            //Because it's an array of tuples, we iterate over the array (orderManager.cart) and as the second argument (id), we set the path to access the tupple, so we know that at position 0 is the id
                            ForEach(orderManager.cart, id:\.0.id) { item in
                                OrderItem(item: item)
                            }
                            .listRowBackground(Color("Background"))
                        }
                        
                        Section ("YOUR DETAILS") {
                            VStack {
                                TextField("Your Name", text: $name)
                                    .textFieldStyle(.roundedBorder)
                                    .border(Color("Alternative2"))
                                    .background(.pink)
                                Spacer()
                                    .frame(height: 20)
                                TextField("Your Phone #", text: $phone)
                                    .keyboardType(.phonePad)
                                    .textFieldStyle(.roundedBorder)
                                    .border(Color("Alternative2"))
                            } .padding(.vertical)
                        }.listRowBackground(Color("Background"))
                        
                        Section() {
                            HStack {
                                Spacer()
                                Text("TOTAL")
                                Spacer()
                                Text("$ \(orderManager.calculateTotal(), specifier: "%.2f")")
                                    .bold()
                                Spacer()
                            }
                        }.listRowBackground(Color(.clear))
                        
                        Section {
                            HStack {
                                Spacer()
                                Button("Place Order") {
                                    //                                orderConfirmed = true
                                }.padding()
                                    .frame(width: 250)
                                    .background(Color("Alternative1"))
                                    .foregroundColor(Color("Alternative2"))
                                    .cornerRadius(25)
                                
                                Spacer()
                            }
                            .listRowBackground(Color.clear)
                        }
                        .listSectionSeparatorTint(Color("Primary"))
                        .listStyle(.insetGrouped)
                    }
                }
            }
            .navigationTitle("Your Order")
        }
        
    }
}

struct OrdersPage_Previews: PreviewProvider {
    static var previews: some View {
        OrdersPage()
            .environmentObject(OrderManager())
    }
}
