//
//  AsyncImageCustom.swift
//  asesoftware
//
//  Created by Angel Rangel on 30/05/24.
//

import Foundation

import SwiftUI

struct AsyncImageCustom: View {
    let url: URL?

    var body: some View {
        ZStack {
            if let url = url {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.gray.opacity(0.3))
                            .cornerRadius(10)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipped()
                            .cornerRadius(10)
                    case .failure(_):
                        Image(systemName: "exclamationmark.triangle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.red)
                            .background(Color.gray.opacity(0.3))
                            .frame(width: 100, height: 100)
                            .cornerRadius(10)
                    @unknown default:
                        EmptyView()
                    }
                }
                .frame(width: 100, height: 100)
                .cornerRadius(10)
            } else {
                Image(systemName: "exclamationmark.triangle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.red)
                    .background(Color.gray.opacity(0.3))
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            }
        }
    }
}

#Preview {
    AsyncImageCustom(url: URL(string: "https://example.com/image.png")!)
}
 
