//
//  OrderView.swift
//  Appetizers
//
//  Created by eslam dweeb on 23/10/2023.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order:Order
    
    var body: some View {
        NavigationView{
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) { item in
                            AppetizerRow(appetizer: item)
                        }.onDelete(perform: order.deleteItem)
                    }
                    .listStyle(.plain)
                    
                    Button {
                        print("$")
                    } label: {
                        Text("$\(order.totalPrice,specifier: "%.2f")- Place Order")
                            .modifier(APBtnStyle())
                    }
                    .padding(.bottom,30)
                }
                if order.items.isEmpty {
                    EmptyStateView(imageName: "empty-order", message: "There is no item in your order")
                }
            }
            .navigationTitle("Order")
        }
    }
    
}

struct OrderView_Previews: PreviewProvider {
     static var previews: some View {
         OrderView().environmentObject(Order())
    }
}
