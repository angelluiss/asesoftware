//
//  DynamicList.swift
//  asesoftware
//
//  Created by Angel Rangel on 30/05/24.
//

import Foundation

import SwiftUI

struct DynamicList: View {
    @ObservedObject var viewModel: MoviesViewModel
    var data: [ResultPopularList] 
    @Binding var searchText: String
    let columns: [GridItem]

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                LazyVGrid(columns: self.columns) {
                    ForEach(data, id: \.id) { popular in
                        HStack {
                            AsyncImageCustom(url: URL(string: "\(Urls.imageURLPath)\(popular.knownFor?.first?.backdropPath ?? "")")!)
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("\(ConstansUtils.stringName): ")
                                        .bold()
                                        .lineLimit(1)
                                    Text(popular.name ?? "")
                                        .lineLimit(1)
                                    Spacer()
                                }
                                HStack {
                                    Text("\(ConstansUtils.stringOName): ")
                                        .bold()
                                        .lineLimit(1)
                                    Text(popular.originalName ?? "")
                                        .lineLimit(1)
                                    Spacer()
                                }
                                HStack {
                                    Text("\(ConstansUtils.stringLanguage): ")
                                        .bold()
                                        .lineLimit(1)
                                    Text(popular.knownFor?.first?.originalLanguage ?? "")
                                        .lineLimit(1)
                                    Spacer()
                                }
                                HStack {
                                    Text("\(ConstansUtils.stringGender): ")
                                        .bold()
                                        .lineLimit(1)
                                    Text("\(popular.gender ?? 0)")
                                        .lineLimit(1)
                                    Spacer()
                                }
                            }
                            Spacer()
                        }
                        .background(ConstantColors.blackOpacity)
                        .cornerRadius(20)
                        .frame(width: geometry.size.width * 0.9)
                    }
                    
                    if !viewModel.hasMoreData && searchText == "" {
                        Text(viewModel.populaListUiState.isLoading ? "Loading.." : "")
                            .foregroundColor(.white)
                            .opacity(1)
                            .onAppear {
                                if viewModel.currentPage == 1 {
                                    viewModel.currentPage += 1
                                }
                                viewModel.getPopularList()
                            }
                    }
                }
            }
            .refreshable {
                viewModel.populaListUiState.data = []
                viewModel.populaListUiState.resultPopularList = []
                viewModel.currentPage = 1
                viewModel.getPopularList()
            }
        }
    }
}



struct DynamicListTop: View {
    @ObservedObject var viewModel: MoviesViewModel
    var data: [TopRatedResponseResult]
 
    let columns: [GridItem]

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                LazyVGrid(columns: self.columns) {
                    ForEach(data, id: \.id) { popular in
                        HStack {
                            AsyncImageCustom(url: URL(string: "\(Urls.imageURLPath)\(popular.backdropPath ?? "")")!)
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("\(ConstansUtils.stringName): ")
                                        .bold()
                                        .lineLimit(1)
                                    Text(popular.name ?? "")
                                        .lineLimit(1)
                                    Spacer()
                                }
                                HStack {
                                    Text("\(ConstansUtils.stringOName): ")
                                        .bold()
                                        .lineLimit(1)
                                    Text(popular.originalName ?? "")
                                        .lineLimit(1)
                                    Spacer()
                                }
                                HStack {
                                    Text("\(ConstansUtils.stringLanguage): ")
                                        .bold()
                                        .lineLimit(1)
                                    Text(popular.originalLanguage ?? "")
                                        .lineLimit(1)
                                    Spacer()
                                }
                                
                            }
                            Spacer()
                        }
                        .background(ConstantColors.blackOpacity)
                        .cornerRadius(20)
                        .frame(width: geometry.size.width * 0.9)
                    }
                    
                    if !viewModel.hasMoreData {
                        Text(viewModel.populaListUiState.isLoading ? "Loading.." : "")
                            .foregroundColor(.white)
                            .opacity(1)
                            .onAppear {
                                if viewModel.currentPage == 1 {
                                    viewModel.currentPage += 1
                                }
                                viewModel.getTopRatedList()
                            }
                    }
                }
            }
            .refreshable {
                viewModel.topRatedListUIState.data = []
                viewModel.topRatedListUIState.resultPopularList = []
                viewModel.currentPage = 1
                
                viewModel.getTopRatedList()
            }
        }
    }
}
