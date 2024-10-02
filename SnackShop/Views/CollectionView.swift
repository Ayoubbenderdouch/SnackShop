//
//  CollectionView.swift
//  SnackShop
//
//  Created by Gontse on 2024/07/20.
//

import SwiftUI

struct CollectionView: View {
  
  @Environment(\.presentationMode) var mode
  
  var body: some View {
    NavigationView {
      ScrollView {
        VStack {
          HStack {
            Text("Order From The Best Of **Snacks**")
              .font(.system(size: 36))
              .padding(.trailing)
            
            Spacer()
            
            Image(systemName: "arrow.left")
              .imageScale(.large)
              .padding()
              .frame(width: 70, height: 90)
              .overlay(RoundedRectangle(cornerRadius: 50)
                .stroke().opacity(0.4))
          }
        }
        .padding(30)
      }
    }
  }
}

#Preview {
  CollectionView()
}


// MARK: - Small Product Card

struct SmallProductCard: View {
  
  var product:Product
  
  var body: some View {
    ZStack {
      Image(product.image)
        .resizable()
        .scaledToFit()
      
      ZStack {
        VStack(alignment: .leading, content: {
          Text("\(product.name)")
            .font(.system(size: 18, weight: .semibold))
            .frame(width: 70)
          
          Text("\(product.category)")
            .font(.system(size: 10))
            .padding()
            .background(.white.opacity(0.5))
            .clipShape(Capsule())
        
          Spacer()
          
          HStack {
            Text("\(product.price)")
              .font(.system(size: 14, weight: .semibold))
            
            Spacer()
            
            Button {
              
            } label: {
              Image(systemName: "basket")
                .imageScale(.large)
                .frame(width: 45, height: 40)
                .background(.black)
                .clipShape(Capsule())
                .foregroundColor(.white)
            }
          }
          .padding(.trailing, -12)
          .padding()
          .frame(maxWidth: .infinity)
          .frame(height: 45)
          .background(.white.opacity(0.5))
          .clipShape(Capsule())
        })
      }
      .padding(20)
      .frame(width: 170, height: 215)
    }
    .frame(width: 170, height: 215)
    .background(product.color.opacity(0.1))
    .clipShape(.rect(cornerRadius: 30))
    .padding(.leading, 10)
  }
}
