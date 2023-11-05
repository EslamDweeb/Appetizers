//
//  ActivityIndicatorView.swift
//  Appetizers
//
//  Created by eslam dweeb on 24/10/2023.
//

import SwiftUI

struct ActivityIndicatorView:UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView.style = .large
        activityIndicatorView.color = .brandPrimary
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
        
}

struct LoadingView:View {
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            ActivityIndicatorView()
        }
    }
}
