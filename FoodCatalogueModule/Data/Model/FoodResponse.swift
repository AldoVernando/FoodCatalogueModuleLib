//
//  FoodResponse.swift
//  FoodCatalogueModule
//
//  Created by aldo vernando on 13/02/21.
//

import Foundation

class FoodListResponse: Codable {
    var hints: [FoodResultResponse]
}

class FoodResultResponse: Codable {
    var food: FoodResponse
}

class FoodResponse: Codable {
    var foodId: String?
    var label: String?
    var nutrients: NutrientResponse
    var category: String?
    var categoryLabel: String?
    var image: String?
}
