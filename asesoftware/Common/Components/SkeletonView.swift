//
//  SkeletonView.swift
//  asesoftware
//
//  Created by Angel Rangel on 30/05/24.
//


import SwiftUI

struct SkeletonView: View {
    var body: some View {
        ZStack {
            VStack{
                HStack {
                    Rectangle()
                        .foregroundColor(ConstantColors.black)
                        .frame(width: ScreenSize.width * 0.642, height: ScreenSize.height * 0.0227)
                        .cornerRadius(figures.cornerRadiusMin)
                        .padding(.leading, ScreenSize.width * 0.03)
                    Rectangle()
                        .foregroundColor(ConstantColors.black)
                        .frame(width: ScreenSize.width * 0.0554, height: ScreenSize.height * 0.0259)
                        .padding(.leading, ScreenSize.horizontalPadding)
                    Rectangle()
                        .foregroundColor(ConstantColors.black)
                        .frame(width: ScreenSize.width * 0.0554, height: ScreenSize.height * 0.0259)
                        .padding(.leading, ScreenSize.horizontalPadding)
                    Spacer()
                }
                .padding(.top)
                
                List(ConstansUtils.rangeLoadListCollectionLinks) { item in
                    HStack {
                        VStack {
                            Rectangle()
                                .foregroundColor(ConstantColors.black)
                                .frame(width: ScreenSize.width * 0.3603, height: ScreenSize.height * 0.0227)
                                .cornerRadius(figures.cornerRadiusMin)
                            Rectangle()
                                .foregroundColor(ConstantColors.black)
                                .frame(width: ScreenSize.width * 0.3603, height: ScreenSize.height * 0.0227)
                                .cornerRadius(figures.cornerRadiusMin)
                        }
                        .padding(.leading, ScreenSize.horizontalPadding)
                        Spacer()
                        Rectangle()
                            .foregroundColor(ConstantColors.black)
                            .frame(width: ScreenSize.width * 0.3603, height: ScreenSize.height * 0.0227)
                            .cornerRadius(figures.cornerRadiusMin)
                            .padding(.trailing, ScreenSize.horizontalPadding)
                    }
                    .frame(width: ScreenSize.width)
                    .listRowBackground(ConstantColors.blackHome)
                    .listRowSeparatorTint(ConstantColors.black)
                    .padding(.trailing, ScreenSize.leadingGeneral)
                }
                .listStyle(.plain)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(ConstantColors.blackHome)
    }
}

struct SkeletonListCollectionLinksView_Previews: PreviewProvider {
    static var previews: some View {
        SkeletonView()
    }
}
