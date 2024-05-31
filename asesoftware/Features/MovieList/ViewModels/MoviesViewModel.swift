//
//  MoviesViewModel.swift
//  asesoftware
//
//  Created by Angel Rangel on 30/05/24.
//

import Foundation
import Combine

class MoviesViewModel: ObservableObject {
    
    let movieListRepository: MovieListRepository
    

    @Published var populaListUiState = PopularListUIState()
    @Published var topRatedListUIState = TopRatedListUIState()
    @Published var currentPage = 1
    @Published var hasMoreData = false
    @Published var clearFilter = false
    @Published var adultFilter = false
    @Published var currentLanguage: OriginalLanguage = .en
    @Published var sliderValue: Double = 5
    
    var movieListCancellables = Set<AnyCancellable>()
    
    init(repository: MovieListRepository) {
        self.movieListRepository = repository
    }
    
    func getPopularList() {
        if !(self.currentPage > 1) {
            populaListUiState.isLoading = true
        }
        
        movieListRepository.getPopularListAction(page: currentPage)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] value in
                    guard self != nil else { return }
                    switch value {
                    case .failure :
                        self?.populaListUiState.isSuccessful = false
                    case .finished :
                        break
                    }
                },
                receiveValue: { [weak self] popularListDomainResponse in
                    guard let self = self else { return }
                    if popularListDomainResponse.success == true {
                
                        if let data =  popularListDomainResponse.results {
                            if data.count != 0 {
                                DispatchQueue.main.async {
                                    if  self.currentPage <= popularListDomainResponse.totalPages ?? 0 {
                                        let filtered = data.compactMap { $0 }
                                        self.populaListUiState.isSuccessful = true
                                        self.populaListUiState.isLoading = false
                                        self.populaListUiState.data.append(contentsOf: filtered  )
                                        self.populaListUiState.resultPopularList.append(contentsOf: filtered  )
                                        self.hasMoreData = self.currentPage == popularListDomainResponse.totalPages
                                        if self.currentPage < popularListDomainResponse.totalPages ?? 0 {
                                            self.currentPage += 1
                                        }
                                    }
                                }
                            }else {
                                self.populaListUiState.isSuccessful = false
                                self.populaListUiState.isLoading = false
                            }

                        }else {
                            self.populaListUiState.isSuccessful = false
                            self.populaListUiState.isLoading = false
                        }
                    } else {
                        self.populaListUiState.isSuccessful = false
                        self.populaListUiState.isLoading = false
                        
                    }
                    
                }
                
            ).store(in: &movieListCancellables)
    }
    
    
    func getTopRatedList() {
        if !(self.currentPage > 1) {
            topRatedListUIState.isLoading = true
        }
        
        movieListRepository.getTopReachedListAction(page: currentPage)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] value in
                    guard self != nil else { return }
                    switch value {
                    case .failure :
                        self?.topRatedListUIState.isSuccessful = false
                    case .finished :
                        break
                    }
                },
                receiveValue: { [weak self] topRatedListDomainResponse in
                    guard let self = self else { return }
                    if topRatedListDomainResponse.success == true {
                
                        if let data =  topRatedListDomainResponse.results {
                            if data.count != 0 {
                                DispatchQueue.main.async {
                                    if  self.currentPage <= topRatedListDomainResponse.totalPages ?? 0 {
                                        let filtered = data.compactMap { $0 }
                                        self.topRatedListUIState.isSuccessful = true
                                        self.topRatedListUIState.isLoading = false
                                        self.topRatedListUIState.data.append(contentsOf: filtered  )
                                        self.topRatedListUIState.resultPopularList.append(contentsOf: filtered  )
                                        self.hasMoreData = self.currentPage == topRatedListDomainResponse.totalPages
                                        if self.currentPage < topRatedListDomainResponse.totalPages ?? 0 {
                                            self.currentPage += 1
                                        }
                                    }
                                }
                            }else {
                                self.topRatedListUIState.isSuccessful = false
                                self.topRatedListUIState.isLoading = false
                            }

                        }else {
                            self.topRatedListUIState.isSuccessful = false
                            self.topRatedListUIState.isLoading = false
                        }
                    } else {
                        self.topRatedListUIState.isSuccessful = false
                        self.topRatedListUIState.isLoading = false
                        
                    }
                    
                }
                
            ).store(in: &movieListCancellables)
    }

    func getFilter(name: String) {
        
        let firstMatchingName =  self.populaListUiState.resultPopularList.filter{ String($0.name ?? "").contains(name)  }.sorted { ($0.gender ?? 0) > ($1.gender ?? 0) }
        
        self.populaListUiState.data = firstMatchingName
        
    }
    
    func filterAdult(type: FilterType, adult: Bool?, language: String?, average: Double?) {
        
        switch type {
        case .adult:
            if let adultNotNull = adult {
                let firstMatchingName =  self.populaListUiState.resultPopularList
                    .filter { (item) -> Bool in
                         if adultNotNull {
                             return item.adult ?? false
                         } else {
                             return !(item.adult ?? false)
                         }
                     }
                    .sorted { ($0.gender ?? 0) > ($1.gender ?? 0) }
                
                self.populaListUiState.data = firstMatchingName
            }
            
        case .original_language:
            if let languageNotNull = language {
                let firstMatchingName =  self.populaListUiState.resultPopularList
                    .filter{ String($0.knownFor?.first?.originalLanguage ?? "").contains(languageNotNull)  }
                    .sorted { ($0.gender ?? 0) > ($1.gender ?? 0) }
                
                self.populaListUiState.data = firstMatchingName
            }
        case .vote_average:
            if let averageNotNull = average {
                let firstMatchingName =  self.populaListUiState.resultPopularList
                    .filter { $0.knownFor?.first?.voteAverage ?? 0.0 == average }
                    .sorted { ($0.gender ?? 0) > ($1.gender ?? 0) }
                
                self.populaListUiState.data = firstMatchingName
            }

        }
        
        
    }

}
