//
//  MovieListRepository.swift
//  asesoftware
//
//  Created by Angel Rangel on 30/05/24.
//

import Foundation
import Combine
import Alamofire

class MovieListRepository: MovieListProtocol {
    func getTopReachedListAction(page: Int) -> AnyPublisher<TopReachedDomain, Error> {
        let tokenTransaction = ApiKeys.apiProductionReadAccesToken
        
        let headerTransaction = HTTPHeader(name: PostMethods.postNameAuth, value: ("\(PostMethods.prefixEdit)\(tokenTransaction)"))
        
        return Future { promise in
            AF.request(Urls.topRatedList + "?language=en-US&page=\(page)",
                       method: .get,
                       parameters: nil,
                       encoding: URLEncoding.default,
                       headers: [headerTransaction, HTTPHeaders.defaultHeaders])
            .responseDecodable(of: TopRatedResponse.self,
                               completionHandler: { response in
                switch response.result {
                case .success(let topRatedResponse):
                    promise(.success(TopReachedDomain(success: true, results: topRatedResponse.results, totalPages: topRatedResponse.totalPages)))
                case .failure(_):
                    promise(.success(TopReachedDomain(success: false, results: nil, totalPages: nil)))
                }
            })
        }
        .timeout(.seconds(ConstansUtils.timeoutTwentyFive), scheduler: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
    
    
    
    func getPopularListAction(page: Int) -> AnyPublisher<PopularDomain, Error> {
        let tokenTransaction = ApiKeys.apiProductionReadAccesToken
        
        let headerTransaction = HTTPHeader(name: PostMethods.postNameAuth, value: ("\(PostMethods.prefixEdit)\(tokenTransaction)"))
        
        return Future { promise in
            AF.request(Urls.popularList + "?language=en-US&page=\(page)",
                       method: .get,
                       parameters: nil,
                       encoding: URLEncoding.default,
                       headers: [headerTransaction, HTTPHeaders.defaultHeaders])
            .responseDecodable(of: PopularResponse.self,
                               completionHandler: { response in
                switch response.result {
                case .success(let populaResponse):
                    promise(.success(PopularDomain(success: true, results: populaResponse.results, totalPages: populaResponse.totalPages)))
                case .failure(_):
                    promise(.success(PopularDomain(success: false, results: nil, totalPages: nil)))
                }
            })
        }
        .timeout(.seconds(ConstansUtils.timeoutTwentyFive), scheduler: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
    
    
}
