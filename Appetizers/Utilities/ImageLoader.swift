//
//  ImageLoader.swift
//  Appetizers
//
//  Created by eslam dweeb on 06/11/2023.
//

import SwiftUI

final class ImageLoader:ObservableObject{
    @Published var image:Image? = nil
    
    func load(fromURLString urlString:String) {
        NetworkManger.shared.downloadImage(formURLString: urlString) { uiImage in
            guard let uiImage else{return}
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}

struct RemoteImage:View {
    var image:Image?
    
    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}


struct AppetizerRemoteImage:View {
    @StateObject var loader = ImageLoader()
    let urlString:String
    var body: some View {
        RemoteImage(image: loader.image)
            .onAppear {
                loader.load(fromURLString: urlString)
            }
    }
}
