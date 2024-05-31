//
//  MockMovieRepository.swift
//  asesoftwareTests
//
//  Created by Angel Rangel on 31/05/24.
//

import Foundation


import Foundation
import Combine
@testable import asesoftware

class MockMovienRepository: MovieListProtocol {
    
    var shouldFail: Bool = false
    var popularData: PopularDomain?
    var topRateData: TopReachedDomain?
    
    func getPopularListAction(page: Int) -> AnyPublisher<asesoftware.PopularDomain, Error> {
        if shouldFail {
            return Fail(error: URLError(.badServerResponse)).eraseToAnyPublisher()
        } else if let popularData = popularData {
            return Just(popularData)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        } else {
            return Fail(error: MockError.noData)
                .eraseToAnyPublisher()
        }
    }
    
    func getTopReachedListAction(page: Int) -> AnyPublisher<asesoftware.TopReachedDomain, Error> {
        if shouldFail {
            return Fail(error: URLError(.badServerResponse)).eraseToAnyPublisher()
        } else if let topRateData = topRateData {
            return Just(topRateData)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        } else {
            return Fail(error: MockError.noData)
                .eraseToAnyPublisher()
        }
    }
    
   
}

enum MockError: Error {
    case noData
}
