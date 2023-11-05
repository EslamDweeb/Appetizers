//
//  Appetizer.swift
//  Appetizers
//
//  Created by eslam dweeb on 23/10/2023.
//

import Foundation
struct Appetizer: Decodable,Identifiable {
    let id: Int
    let description: String
    let carbs: Int
    let price: Double
    let protein, calories: Int
    let imageURL: String
    let name: String
}

struct AppetizerResponse:Decodable {
    let request:[Appetizer]
}


struct MockData{
    static let sampleAppetizer = Appetizer(id: 0003, description: "This is my appetizer.It's ugly hhhhhh!!", carbs: 99, price: 9.99, protein: 99, calories: 99, imageURL: "", name: "ED Appetizer")
    static let appetizers = [sampleAppetizer,sampleAppetizer,sampleAppetizer,sampleAppetizer]
}
