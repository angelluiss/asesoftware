//
//  TopRatedListView.swift
//  asesoftware
//
//  Created by Angel Rangel on 31/05/24.
//

import Foundation

import SwiftUI

struct TopRatedListView: View {
    
    @EnvironmentObject var movieViewModel: MoviesViewModel
    @State var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 1)

  
    
    var body: some View {
        
        ZStack{
            if movieViewModel.topRatedListUIState.isLoading {
                SkeletonView()
            } else if movieViewModel.topRatedListUIState.isSuccessful == false {
                VStack{
                    Spacer()
                    Text(Messages.noElements)
                    Spacer()
                }
            }else{
                ZStack {
                    VStack{
                        
                        HStack{
                            Text("TopRated")
                                .bold()
                                .font(.title2)
                            
                            
                            
                        }
                        
                        
                        DynamicListTop(
                            viewModel: movieViewModel,
                            data: movieViewModel.topRatedListUIState.data,
                            columns: columns
                        )
                        
                        
                    }
                }
            }
        }
        .onAppear{
           
            movieViewModel.topRatedListUIState.data = []
            movieViewModel.topRatedListUIState.resultPopularList = []
            movieViewModel.currentPage = 1
            
            movieViewModel.getTopRatedList()
            
            
        }
        
    }
}
