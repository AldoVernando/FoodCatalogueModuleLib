//
//  Injection.swift
//  FoodCatalogueModule
//
//  Created by aldo vernando on 13/02/21.
//

import Foundation

public class Injection: NSObject {
    
    private func provideRemoteDataSource() -> RemoteDataSourceProtocol {
        return RemoteDataSource()
    }
    
    private func provideRepository() -> FoodRepositoryProtocol {
        let remote = provideRemoteDataSource()
        return FoodRepository(remote: remote)
    }
    
    public func provideInteractor() -> FoodUseCase {
        let foodRepository = provideRepository()
        return FoodInteractor(repository: foodRepository)
    }
}
