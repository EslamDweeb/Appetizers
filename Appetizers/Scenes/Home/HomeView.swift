//
//  HomeView.swift
//  Appetizers
//
//  Created by eslam dweeb on 23/10/2023.
//

import SwiftUI

struct HomeView: View {
   @StateObject var viewModel = HomeViewModel()
    var body: some View {
        ZStack {
            NavigationView{
                List(viewModel.appetizersList) { appetizer in
                    AppetizerRow(appetizer: appetizer)
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                            viewModel.isShowingDetailView.toggle()
                        }
                }
                .listStyle(.plain)
                .navigationTitle("Appetizers")
                .disabled(viewModel.isShowingDetailView)
            }
            .onAppear{
                viewModel.getAppetizers()
            }
            .blur(radius: viewModel.isShowingDetailView ? 20:0)
            if viewModel.isShowingDetailView {
                ItemDetailView(appetizer: viewModel.selectedAppetizer ?? MockData.sampleAppetizer, isShowingDetailView: $viewModel.isShowingDetailView)
            }
            if viewModel.isLoading {
                LoadingView()
            }
            
        }
        .alert(item: $viewModel.alertItem) { alert in
            Alert(
                title: alert.title,
                message: alert.message,
                dismissButton: alert.dismissButton
            )
        }
    }
   
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

