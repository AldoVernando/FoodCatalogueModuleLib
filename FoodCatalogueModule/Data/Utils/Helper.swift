//
//  Helper.swift
//  FoodCatalogueModule
//
//  Created by aldo vernando on 13/02/21.
//

import Foundation

class Helper {
    
    static func generateParameter(param: [String: Any]) -> String {
        return (param.compactMap { (key, value) -> String in
            return "\(key)=\(value)"
        } as Array).joined(separator: "&")
    }
}
