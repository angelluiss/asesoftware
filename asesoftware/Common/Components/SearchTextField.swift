//
//  SearchTextField.swift
//  asesoftware
//
//  Created by Angel Rangel on 30/05/24.
//



import SwiftUI

struct SearchTextField: View {
    @Binding var text: String
    @FocusState private var isFocused: Bool
    
    let placeholder: String
    let onSearchTextChange: (String) -> Void
    
    var body: some View {
        TextField(placeholder, text: $text)
            .frame(height: UIScreen.main.bounds.height * 0.05)
            .focused($isFocused)
            .tint(Color.white)
            .foregroundColor(Color.white)
            .padding(.horizontal)
            .background(Color.gray)
            .cornerRadius(8)
            .onAppear {
                isFocused = true
            }
            .onChange(of: text) { newValue in
                onSearchTextChange(newValue)
            }
    }
}

struct SearchTextField_Previews: PreviewProvider {
    @State static var searchText = "Sample text"
    
    static var previews: some View {
        SearchTextField(text: $searchText, placeholder: "Search...", onSearchTextChange: { newValue in
            // Mock function for preview
            print("Search text changed to: \(newValue)")
        })
        .padding()
        .background(Color.black)
    }
}
