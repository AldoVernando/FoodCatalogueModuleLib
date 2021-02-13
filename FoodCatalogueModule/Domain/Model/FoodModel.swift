//
//  FoodModel.swift
//  FoodCatalogueModule
//
//  Created by aldo vernando on 13/02/21.
//

import Foundation

class FoodModel {
    var id: String
    var label: String
    var nutrients: NutrientModel?
    var category: String?
    var categoryLabel: String?
    var image: String
    
    init(id: String, label: String?, nutrients: NutrientModel?, category: String?, categoryLabel: String? = "", image: String) {
        self.id = id
        self.label = label ?? ""
        self.nutrients = nutrients
        self.category = category
        self.categoryLabel = categoryLabel
        self.image = image
    }
}
