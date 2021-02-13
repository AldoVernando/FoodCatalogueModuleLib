//
//  FoodInteractor.swift
//  FoodCatalogueModule
//
//  Created by aldo vernando on 13/02/21.
//

import Foundation
import RxSwift

protocol FoodUseCase {
    func getFoodList(keyword: String, page: Int) -> Observable<[FoodModel]>
}

class FoodInteractor: FoodUseCase {
    
    private let foodRepository: FoodRepositoryProtocol
    
    init(repository: FoodRepositoryProtocol) {
        self.foodRepository = repository
    }
    
    func getFoodList(keyword: String = "", page: Int = 0) -> Observable<[FoodModel]> {
        return foodRepository.getFoodList(keyword: keyword, page: page)
    }
}
