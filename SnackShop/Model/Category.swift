//
//  Category.swift
//  SnackShop
//
//  Created by Gontse on 2024/07/16.
//

import SwiftUI

struct Category: Identifiable, Hashable {
  var id: UUID = .init()
  var icon: String
  var title: String
}

var categoryList: [Category] = [
  Category(icon: "", title: "All"),
  Category(icon: "", title: "Choco"),
  Category(icon: "", title: "Waffles"),
  Category(icon: "", title: "Toffee")
]
