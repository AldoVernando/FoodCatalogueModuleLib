//
//  RemoteDataSource.swift
//  FoodCatalogueModule
//
//  Created by aldo vernando on 13/02/21.
//

import Foundation
import Alamofire
import RxSwift

protocol RemoteDataSourceProtocol {
    func getFoodList(keyword: String, page: Int) -> Observable<[FoodResultResponse]>
}

class RemoteDataSource: RemoteDataSourceProtocol {
    
    func getFoodList(keyword: String = "-", page: Int = 0) -> Observable<[FoodResultResponse]> {
        
        let parameters: [String : Any] = [
            "page": page,
            "ingr": keyword,
            "app_id": Constant.APP_ID,
            "app_key": Constant.API_KEY
        ]
        
        let urlParameters = Helper.generateParameter(param: parameters)
        let url = "\(Endpoint.Foods.getList.url)?\(urlParameters)"
        
        return Observable<[FoodResultResponse]>.create { observer in
        
            AF.request(url, method: .get).responseDecodable(of: FoodListResponse.self) { response in
                switch response.result {
                case .success(let value):
                    observer.onNext(value.hints)
                    observer.onCompleted()
                case .failure(let error):
                    observer.onError(error)
                }
            }
            
            return Disposables.create()
        }
    }
}
