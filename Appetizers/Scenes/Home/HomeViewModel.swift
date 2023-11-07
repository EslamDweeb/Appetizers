//
//  HomeViewModel.swift
//  Appetizers
//
//  Created by eslam dweeb on 24/10/2023.
//

import Foundation
//import SwiftUI

final class HomeViewModel:ObservableObject {
    @Published  var appetizersList:[Appetizer] = []
    @Published  var alertItem:AlertItem?
    @Published  var isLoading = false
    @Published  var isShowingDetailView = false
    @Published  var selectedAppetizer:Appetizer? 
    func getAppetizers(){
        isLoading = true
        NetworkManger.shared.getAppetizers {[weak self] result in
            guard let self else{return}
            DispatchQueue.main.async{
                self.isLoading = false
                switch result {
                case .success(let appetizers):
                    self.appetizersList = appetizers
                case .failure(let failure):
                    switch failure {
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}
