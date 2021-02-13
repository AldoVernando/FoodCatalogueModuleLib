//
//  FoodRepository.swift
//  FoodCatalogueModule
//
//  Created by aldo vernando on 13/02/21.
//

import Foundation
import RxSwift

protocol FoodRepositoryProtocol {
    func getFoodList(keyword: String, page: Int) -> Observable<[FoodModel]>
}

class FoodRepository: FoodRepositoryProtocol {
    
    private let remote: RemoteDataSourceProtocol
    private let locale: LocaleDataSourceProtocol
    
    init(remote: RemoteDataSourceProtocol, locale: LocaleDataSourceProtocol) {
        self.remote = remote
        self.locale = locale
    }
    
    func getFoodList(keyword: String = "-", page: Int = 0) -> Observable<[FoodModel]> {
        
        var foods: [FoodModel] = []
            
        return Observable<[FoodModel]>.create { observer in
            
            self.remote.getFoodList(keyword: keyword, page: page)
                .observeOn(MainScheduler.instance)
                .subscribe { result in
                    foods = result.map { foodResult -> FoodModel in
                        let food = foodResult.food
                        let nutrients = food.nutrients
                        
                        return FoodModel(id: food.foodId ?? "", label: food.label ?? "", nutrients: NutrientModel(energy: nutrients.ENERC_KCAL ?? 0, protein: nutrients.PROCNT ?? 0, fat: nutrients.FAT ?? 0, carbs: nutrients.CHOCDF ?? 0, fiber: nutrients.FIBTG ?? 0), category: food.category ?? "", categoryLabel: food.categoryLabel ?? "", image: food.image ?? "")
                    }
                } onCompleted: {
                    observer.onNext(foods)
                    observer.onCompleted()
                }
            
            return Disposables.create()
        }
    }
}
