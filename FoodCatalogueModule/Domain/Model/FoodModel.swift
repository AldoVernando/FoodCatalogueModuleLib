//
//  FoodModel.swift
//  FoodCatalogueModule
//
//  Created by aldo vernando on 13/02/21.
//

import Foundation

public class FoodModel {
    public var id: String
    public var label: String
    public var nutrients: NutrientModel?
    public var category: String?
    public var categoryLabel: String?
    public var image: String
    
    public init(id: String, label: String?, nutrients: NutrientModel?, category: String?, categoryLabel: String? = "", image: String) {
        self.id = id
        self.label = label ?? ""
        self.nutrients = nutrients
        self.category = category
        self.categoryLabel = categoryLabel
        self.image = image
    }
}
