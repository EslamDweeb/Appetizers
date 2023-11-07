//
//  User.swift
//  Appetizers
//
//  Created by eslam dweeb on 07/11/2023.
//

import Foundation

struct User:Codable {
    var firstName       = ""
    var lastName        = ""
    var email           = ""
    var birthday        = Date()
    var extraNapkins    = false
    var frequentRefills = false
}
