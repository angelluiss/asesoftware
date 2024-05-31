//
//  MovieListProtocol.swift
//  asesoftware
//
//  Created by Angel Rangel on 30/05/24.
//

import Foundation
import Combine


protocol MovieListProtocol {
    func getPopularListAction(page: Int) -> AnyPublisher<PopularDomain,Error>
    func getTopReachedListAction(page: Int) -> AnyPublisher<TopReachedDomain,Error>
}
