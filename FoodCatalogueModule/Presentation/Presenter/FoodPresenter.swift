//
//  FoodPresenter.swift
//  FoodCatalogueModule
//
//  Created by aldo vernando on 13/02/21.
//

import Foundation
import RxSwift

protocol FoodPresenterProtocol {
    func getFoodList(keyword: String, page: Int) -> Observable<[FoodModel]>
}

public class FoodPresenter: FoodPresenterProtocol {
    
    private let foodInteractor: FoodUseCase
    
    public init() {
        self.foodInteractor = Injection.init().provideInteractor()
    }
    
    public func getFoodList(keyword: String = "-", page: Int = 0) -> Observable<[FoodModel]> {
        return foodInteractor.getFoodList(keyword: keyword, page: page)
    }
}
