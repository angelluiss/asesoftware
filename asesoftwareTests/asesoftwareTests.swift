//
//  asesoftwareTests.swift
//  asesoftwareTests
//
//  Created by Angel Rangel on 30/05/24.
//

import XCTest
@testable import asesoftware



final class asesoftwareTests: XCTestCase {
 
    func testGetWithdrawActionExists() {
        let moviesViewModel = MoviesViewModel(repository: MovieListRepository())
        let methodGetWithdrawAction = moviesViewModel.movieListRepository.getPopularListAction(page: 1)
        XCTAssertNotNil(methodGetWithdrawAction)
    }
    
    func testGetWithdrawActionSuccessful() {
        let mockRepository = MockMovienRepository()
        mockRepository.popularData = PopularDomain(success: true, results: [], totalPages: 10)
      
    }
    
 
}
