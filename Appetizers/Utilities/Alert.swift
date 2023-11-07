//
//  Alert.swift
//  Appetizers
//
//  Created by eslam dweeb on 24/10/2023.
//

import SwiftUI
struct AlertItem:Identifiable{
    let id = UUID()
    let title:Text
    let message:Text
    let dismissButton:Alert.Button
}
struct AlertContext{
    //MARK: - API ALerts
    static let invalidData        = AlertItem(title: Text("Server Error"),
                                              message: Text("The data received from the server was invalid. Please contact support ."), dismissButton: .default(Text("ok")))
    
    static let invalidResponse    = AlertItem(title:  Text("Server Error"),
                                              message: Text("Inavlid  response from the server . Please try again later or contact support ."),
                                              dismissButton: .default(Text("ok")))
    
    static let invalidURL         = AlertItem(title:  Text("Server Error"),
                                              message: Text("The was an issue connecting to the server . If this persists, please contact support ."),
                                              dismissButton: .default(Text("ok")))
    
    static let unableToComplete   = AlertItem(title:  Text("Server Error"),
                                              message: Text("Unable to complete your request at this time . Please check your internet conncection."),
                                              dismissButton: .default(Text("ok")))
    
    //MARK: - Account Form Alerts
    
    static let invalidForm       = AlertItem(title:  Text("Invalid Form"),
                                              message: Text("Please ensure all fields in the form have been filled out."),
                                              dismissButton: .default(Text("ok")))
    
    static let invalidEmail      = AlertItem(title:  Text("Invalid Email"),
                                              message: Text("Please ensure your email is correct."),
                                              dismissButton: .default(Text("ok")))
    
    static let userSaveSuccess      = AlertItem(title:  Text("Profile Saved"),
                                              message: Text("Your profile data was successfully saved."),
                                              dismissButton: .default(Text("ok")))
    
    static let userSaveError      = AlertItem(title:  Text("Profile Error"),
                                              message: Text("There wan an error saving or retrieving your profile."),
                                              dismissButton: .default(Text("ok")))
}
