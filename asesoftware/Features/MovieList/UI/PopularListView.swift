//
//  PopularListView.swift
//  asesoftware
//
//  Created by Angel Rangel on 30/05/24.
//

import Foundation
import SwiftUI

struct PopularListView: View {
    
    @EnvironmentObject var movieViewModel: MoviesViewModel
    @State var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 1)
    @State private var searchText = ""
    @Binding var toFilter: Bool
    
    var body: some View {
        
        ZStack{
            if movieViewModel.populaListUiState.isLoading {
                SkeletonView()
            } else if movieViewModel.populaListUiState.isSuccessful == false {
                VStack{
                    Spacer()
                    Text(Messages.noElements)
                    Spacer()
                }
            }else{
                ZStack {
                    VStack{
                        
                        HStack{
                            Text("Popular")
                                .bold()
                                .font(.title2)
                            
                            Button {
                                toFilter = true
                            } label: {
                                HStack{
                                    Image(systemName: "slider.vertical.3")
                                    Text("filters")
                                        .font(.title3)
                                }
                                
                            }

                        }
                        HStack{
                            SearchTextField(text: $searchText, placeholder: "Search...", onSearchTextChange: { newValue in
                              
                                movieViewModel.getFilter(name: newValue)
                            })
                            .padding(4)
                        }
                        .padding()
                        
                        DynamicList(
                            viewModel: movieViewModel,
                            data: movieViewModel.populaListUiState.data,
                            searchText: $searchText,
                            columns: columns
                        )

                        
                    }
                }
            }
        }
        .onAppear{
            if !movieViewModel.clearFilter {
                movieViewModel.populaListUiState.data = []
                movieViewModel.populaListUiState.resultPopularList = []
                movieViewModel.currentPage = 1
                
                movieViewModel.getPopularList()
            }
            
        }
        
    }
}
