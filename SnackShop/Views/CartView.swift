//
//  CartView.swift
//  SnackShop
//
//  Created by Gontse on 2024/07/20.
//

import SwiftUI

struct CartView: View {
  
  @Environment(\.presentationMode) var mode
  
  var body: some View {
    NavigationView {
      ScrollView {
        VStack {
          HStack {
            Text("Cart")
              .font(.system(size: 36))
              .padding(.trailing)
            
            Spacer()
            
            Button {
              mode.wrappedValue.dismiss()
            } label: {
               Text("3")
                .imageScale(.large)
                .padding()
                .frame(width: 70, height: 90)
                .background(.green.opacity(0.2))
                .clipShape(Capsule())
                
            }
            .foregroundColor(.black)
            
            Button {
              mode.wrappedValue.dismiss()
            } label: {
              Image(systemName: "arrow.left")
                .imageScale(.large)
                .padding()
                .frame(width: 70, height: 90)
                .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))
                
            }
            .foregroundColor(.black)
          }
        }
        .padding(30)
        
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
          ForEach(productList, id: \.id) { product in
            SmallProductCard(product: product)
          }
        })
        
      }
    }
  }
}

#Preview {
  CartView()
}
