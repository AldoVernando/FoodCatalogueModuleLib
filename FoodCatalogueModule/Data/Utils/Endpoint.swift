//
//  Endpoint.swift
//  FoodCatalogueModule
//
//  Created by aldo vernando on 13/02/21.
//

import Foundation

class Endpoint {
    
    enum Foods: String {
        case getList = "/api/food-database/v2/parser"
        case getDetail = "/api/food-database/v2/nutrients"
        
        var url: String {
            return Constant.BASE_URL + self.rawValue
        }
    }
}
