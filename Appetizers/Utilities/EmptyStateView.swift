//
//  EmptyStateView.swift
//  Appetizers
//
//  Created by eslam dweeb on 07/11/2023.
//

import SwiftUI

struct EmptyStateView: View {
    let imageName:String
    let message:String
    
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .ignoresSafeArea()
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                Text(message)
                    .foregroundColor(.secondary)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            .offset(y:-40)
        }
    }
}

struct EmptyStateView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStateView(imageName: "empty-order", message: "Default Message")
    }
}
