//
//  FiltersView.swift
//  asesoftware
//
//  Created by Angel Rangel on 30/05/24.
//

import Foundation
import SwiftUI

struct FilterView: View {
    
    @EnvironmentObject var movieViewModel: MoviesViewModel
    @State var isTrue: Bool = true
    
    
    var body: some View {
        VStack{
            Button {
                movieViewModel.clearFilter = false
                movieViewModel.populaListUiState.data = movieViewModel.populaListUiState.resultPopularList
            } label: {
                Text("Clear Filters")
            }

            Text("Adult")
            TrueFalseToggle(isTrue: $movieViewModel.adultFilter) { newValue in
                movieViewModel.clearFilter = true
                movieViewModel.filterAdult(type: .adult, adult: isTrue, language: nil, average: nil)
            }
            .padding()

            VStack {
                Text("Select language")
                    .padding()
                
                LanguageSegmentedControl(selectedLanguage: $movieViewModel.currentLanguage) { newLanguage in
                    movieViewModel.currentLanguage = newLanguage
                    movieViewModel.clearFilter = true
                    movieViewModel.filterAdult(type: .original_language, adult: nil, language: newLanguage.rawValue, average: nil)
                }
            }
            .padding()
            
            
            VStack {
                Text("Average: \(Int(movieViewModel.sliderValue))")
                    .padding()
                
                Slider(value: $movieViewModel.sliderValue, in: 1...10, step: 1) { _ in
                    print("Nuevo valor: \(Int(movieViewModel.sliderValue))")
                    movieViewModel.clearFilter = true
                    movieViewModel.filterAdult(type: .vote_average, adult: nil, language: nil, average: movieViewModel.sliderValue)
                }
                .padding()
            }
        }
        .onAppear{
            movieViewModel.clearFilter = false
        }
    }
    
}
