//
//  ToogleGeneric.swift
//  asesoftware
//
//  Created by Angel Rangel on 31/05/24.
//

import Foundation

import SwiftUI

struct TrueFalseToggle: View {
    @Binding var isTrue: Bool
    var action: (Bool) -> Void

    var body: some View {
        HStack {
            Button(action: {
                self.isTrue = true
                self.action(true)
            }) {
                Text("True")
                    .padding()
                    .foregroundColor(.white)
                    .background(isTrue ? Color.green : Color.gray)
                    .cornerRadius(8)
            }
            .buttonStyle(PlainButtonStyle())

            Button(action: {
                self.isTrue = false
                self.action(false)
            }) {
                Text("False")
                    .padding()
                    .foregroundColor(.white)
                    .background(!isTrue ? Color.red : Color.gray)
                    .cornerRadius(8)
            }
            .buttonStyle(PlainButtonStyle())
        }
    }
}

struct TrueFalseToggle_Previews: PreviewProvider {
    @State static var isTrue: Bool = true

    static var previews: some View {
        TrueFalseToggle(isTrue: $isTrue) { newValue in
            print("New value is: \(newValue)")
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
