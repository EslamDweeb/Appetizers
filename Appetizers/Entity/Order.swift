//
//  Order.swift
//  Appetizers
//
//  Created by eslam dweeb on 07/11/2023.
//

import SwiftUI


final class Order:ObservableObject {
    @Published var items = [Appetizer]()
    
    var count:Int {
        items.count
    }
    var totalPrice:Double {
        items.reduce(0){$0 + $1.price}
    }
    func addItem(_ appetizer:Appetizer){
        items.append(appetizer)
    }
    func deleteItem(_ offset:IndexSet){
        items.remove(atOffsets: offset)
    }
}
