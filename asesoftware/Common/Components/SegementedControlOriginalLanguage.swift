//
//  SegementedControlOriginalLanguage.swift
//  asesoftware
//
//  Created by Angel Rangel on 31/05/24.
//

import Foundation

import SwiftUI

struct LanguageSegmentedControl: View {
    @Binding var selectedLanguage: OriginalLanguage 
    var onLanguageChange: (OriginalLanguage) -> Void

    var body: some View {
        VStack {
            Picker("Select Language", selection: $selectedLanguage) {
                ForEach(OriginalLanguage.allCases) { language in
                    Text(language.displayName).tag(language)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .onChange(of: selectedLanguage) { newValue in
                onLanguageChange(newValue)
            }
        }
        .padding()
    }
}
