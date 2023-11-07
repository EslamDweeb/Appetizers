//
//  ItemDetailView.swift
//  Appetizers
//
//  Created by eslam dweeb on 06/11/2023.
//

import SwiftUI

struct ItemDetailView: View {
    @EnvironmentObject var order:Order
    let appetizer:Appetizer
    @Binding var isShowingDetailView:Bool
    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 280,height: 225)
            VStack{
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                HStack(spacing:40) {
                   NutritionInfo(title: "Calories", value: "\(appetizer.calories)")
                    NutritionInfo(title: "Carbs", value: "\(appetizer.carbs)")
                    NutritionInfo(title: "Protein", value: "\(appetizer.protein)")
                }
            }
            Spacer()
                
            Button {
                order.addItem(appetizer)
                isShowingDetailView = false
            } label: {
                Text("$\(appetizer.price,specifier: "%.2f") - Add To Order")
                    .modifier(APBtnStyle())
            }
            .padding(.bottom,30)
        }
        .frame(width: 300,height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(alignment: .topTrailing){
            Button {
                isShowingDetailView.toggle()
            } label: {
                XDissmisBtn()
               
            }
        }
    }
}


struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(appetizer: MockData.sampleAppetizer, isShowingDetailView: .constant(false))
    }
}
struct NutritionInfo:View {
    var title:String
    var value:String
    var body: some View {
        VStack(spacing:5){
            Text(title)
                .font(.caption)
                .bold()
            Text(value)
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}

struct XDissmisBtn: View {
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.white)
                .frame(width: 30,height: 30)
                .opacity(0.6)
            Image(systemName: "xmark")
                .imageScale(.small)
                .foregroundColor(.black)
                .frame(width: 44,height: 44)
        }
    }
}

struct APBtnStyle:ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .frame(width: 260,height: 50)
            .background(Color.brandPrimary)
            .cornerRadius(8)
    }
}
