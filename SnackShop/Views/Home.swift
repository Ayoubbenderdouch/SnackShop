//
//  Home.swift
//  SnackShop
//
//  Created by Gontse on 2024/07/16.
//

import SwiftUI

struct Home: View {
  
  @State private var selectedCategory = ""
  
  var body: some View {
    NavigationView {
      ScrollView {
        VStack {
          
          //MARK: - Header
          HStack {
            Text("Order From The Best Of **Snacks**")
              .font(.system(size: 36))
              .padding(.trailing)
            
            Spacer()
            
            Image(systemName: "line.3.horizontal")
              .imageScale(.large)
              .padding()
              .frame(width: 70, height: 90)
              .overlay(RoundedRectangle(cornerRadius: 50)
                .stroke().opacity(0.4))
          }
        }
        .padding(30)
        
        // MARK: - CategoryList
        CategoryListView
        
        // MARK: - Collection View
        HStack {
          Text("Choco **Collections**")
            .font(.system(size: 24))
          
          Spacer()
          NavigationLink {
            CollectionView()
          } label: {
            Image(systemName: "arrow.right")
              .imageScale(.large)
              .bold()
          }
          .foregroundColor(.black)
          
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 15)
        
        // MARK: - Product List
        
        ScrollView(.horizontal, showsIndicators: false) {
          HStack {
            ForEach(productList, id: \.id) { product in
              ProductCard(product: product)
            }
          }
        }
      }
    }
  }
  
  var CategoryListView: some View {
    HStack {
      ScrollView(.horizontal, showsIndicators: false) {
        HStack{
          ForEach(categoryList, id: \.id) { item in
            Button {
              selectedCategory = item.title
            } label: {
              HStack {
                if item.title.capitalized != "All" {
                  Image(item.icon)
                    .foregroundColor(selectedCategory == item.title ? .white : .black)
                }
                Text(item.title)
              }
              .padding()
              .background(selectedCategory == item.title ? .black : .gray.opacity(0.1))
              .foregroundColor(selectedCategory == item.title ? .white : .black)
              .clipShape(Capsule())
            }
          }
        }
      }
    }
  }
}

#Preview {
    Home()
}

struct ProductCard: View {
  
  var product: Product
  
  var body: some View {
    ZStack {
      Image(product.image)
        .resizable()
        .scaledToFit()
        .padding(.trailing, -200)
        .rotationEffect(Angle(degrees: 30))
      
      ZStack {
        VStack(alignment: .leading) {
          Text("\(product.name)")
            .font(.system(size: 30, weight: .semibold))
            .frame(width: 140)
          
          Text(product.category.rawValue)
            .font(.callout)
            .padding()
            .background(.white.opacity(0.8))
            .clipShape(Capsule())
          
          Spacer()
          
          HStack {
            Text(String(format: "R %.2g", product.price))
              .font(.system(size: 25, weight: .semibold))
            
            Spacer()
            
            Button {
              
            } label: {
              Image(systemName: "basket")
                .foregroundColor(.white)
                .imageScale(.large)
                .padding()
                .frame(width: 90, height: 60)
                .background(.black)
                .clipShape(Capsule())
            }
          }
          .padding(.leading)
          .padding()
          .frame(maxWidth: .infinity)
          .frame(height: 80)
          .background(.white.opacity(0.9))
          .clipShape(Capsule())
        }
      }
      .padding(30)
      .frame(width: 336, height: 432)
    }
    .frame(width: 336, height: 422)
    .background(product.color.opacity(0.1))
    .clipShape(.rect(cornerRadius: 57))
    .padding(.leading, 20)
  }
  
  private func convertNumberToCurrently(_ number: Double) {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.maximumSignificantDigits = 2
    formatter.locale = Locale(identifier: "en_US")
    
   let formattedNumber = formatter.string(from: NSNumber(value: number))
    print(formattedNumber)
  }
  
 
  
}
