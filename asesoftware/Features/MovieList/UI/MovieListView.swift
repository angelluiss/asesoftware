//
//  MovieListView.swift
//  asesoftware
//
//  Created by Angel Rangel on 30/05/24.
//


import SwiftUI

struct MovieListView: View {
    @State private var selectedSegment = 0
    @StateObject var movieViewModel = MoviesViewModel(repository: MovieListRepository())
    @State var toFilter = false
    var body: some View {
        NavigationStack{
            ZStack{
                NavigationLink(destination: FilterView().environmentObject(movieViewModel), isActive: $toFilter) { EmptyView() }
                VStack {
                    Picker("Select View", selection: $selectedSegment) {
                        Text(Messages.popularTittle).tag(0)
                        Text(Messages.topRatepTittle).tag(1)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()

                    ZStack {
                        if selectedSegment == 0 {
                            PopularListView(toFilter: $toFilter)
                                .environmentObject(movieViewModel)
                                .transition(.opacity)
                        } else {
                            TopRatedListView()
                                .environmentObject(movieViewModel)
                                .transition(.slide)
                        }
                    }
                    .animation(.easeInOut, value: selectedSegment)
                }
            }
           
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        
    }
}
struct View1: View {
    var body: some View {
        VStack {
            Text("This is View 1")
                .font(.largeTitle)
                .padding()
            Spacer()
        }
        .background(Color.blue.opacity(0.3))
        .cornerRadius(10)
        .padding()
    }
}

struct View2: View {
    var body: some View {
        VStack {
            Text("This is View 2")
                .font(.largeTitle)
                .padding()
            Spacer()
        }
        .background(Color.green.opacity(0.3))
        .cornerRadius(10)
        .padding()
    }
}


#Preview(body: {
    MovieListView()
})

