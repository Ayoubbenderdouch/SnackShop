//
//  Product.swift
//  SnackShop
//
//  Created by Gontse on 2024/07/16.
//

import SwiftUI

enum ProductCategory: String {
  case choco = "Choco"
  case chips = "Chips"
}

struct Product: Identifiable {
  var id: UUID = .init()
  var name: String
  var category: ProductCategory
  var image: String
  var color: Color
  var price: Double
}

var productList = [
  Product(name: "BBQ Chips", category: .choco, image: "BBQChips", color: .brown, price: 10.00),
  Product(name: "Choc Chips Cookies", category: .choco, image: "ChocChipCookies", color: .purple, price: 10.00),
  Product(name: "Prawn Cocktail Chips", category: .chips, image: "PrawnCocktailChips", color: .pink, price: 10.00),
  Product(name: "Salt & Vinegar Fries", category: .chips, image: "SaltVinegarFries", color: .blue, price: 10.00),
  Product(name: "Straw Berry Strings", category: .chips, image: "StrawberryStrings", color: .orange, price: 10.00),
  Product(name: "Poppod Corn", category: .chips, image: "SourCreamChivesPoppedCorn", color: .green, price: 10.00)
]

