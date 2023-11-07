//
//  AppetizerRow.swift
//  Appetizers
//
//  Created by eslam dweeb on 23/10/2023.
//

import SwiftUI

struct AppetizerRow: View {
    let appetizer:Appetizer
    var body: some View {
        HStack{
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .frame(width: 120,height: 90)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(8)
            VStack(alignment: .leading,spacing: 4) {
                Text(appetizer.name)
                    .multilineTextAlignment(.leading)
                    .fontWeight(.medium)
                    .font(.system(size: 18))
                Text("$\(appetizer.price,specifier: "%.2f")")
                    .fontWeight(.bold)
                    .font(.system(size: 16))
                    .foregroundColor(.secondary)
                    
            }
            //.padding(.leading)
        }
    }
}

struct AppetizerRow_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerRow(appetizer: MockData.sampleAppetizer)
    }
}
