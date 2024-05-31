//
//  TopRatedUIState.swift
//  asesoftware
//
//  Created by Angel Rangel on 31/05/24.
//

import Foundation

struct TopRatedListUIState {
    var isSuccessful: Bool = false
    var isLoading: Bool = false
    var data: [TopRatedResponseResult] = []
    var resultPopularList: [TopRatedResponseResult] = []
    var page: Int = 1
    var limit: Int = 100
    var totalCount: Int = 0
    var paginations: Int = 0
    var errorResponse: Bool = false
    var auth: Bool = false
    var withoutNet: Bool = false
    var noFindSearch: Bool = false
}
