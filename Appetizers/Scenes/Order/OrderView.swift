//
//  OrderView.swift
//  Appetizers
//
//  Created by eslam dweeb on 23/10/2023.
//

import SwiftUI

struct OrderView: View {
    var body: some View {
        NavigationView{
            Text("Hello, Order View!")
                .navigationTitle("Order")
        }
           
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
