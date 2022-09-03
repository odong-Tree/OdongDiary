//
//  TitleStackView.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/09/01.
//

import SwiftUI

struct TitleStackView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    @EnvironmentObject var colorSet: ColorSet
    
    @State var isShowingSettingView: Bool = false
    
    @State private var height: CGFloat = .zero
    
    var body: some View {
        HStack {
            Menu {
                Button("최신순") { viewModel.sortType = .dateAscending }
                Button("오래된순") { viewModel.sortType = .dateDesending }
            } label: {
                ZStack {
                    Color.clear
                    
                    Image(systemName: "line.3.horizontal.decrease")
                }
            }
            .fixedSize(horizontal: true, vertical: false)
            
            Spacer()
            
            Text(viewModel.diaryName)
                .font(.title)
            
            Spacer()
            
            Button {
                isShowingSettingView = true
            } label: {
                ZStack {
                    Color.clear
                    
                    Image(systemName: "gearshape.fill")
                }
            }
            .fixedSize(horizontal: true, vertical: false)
            .popover(isPresented: $isShowingSettingView) {
                SettingView()
                    .onDisappear(perform: {
                        isShowingSettingView = false
                    })
                    .background(colorSet.second())
            }
        }
        .foregroundColor(colorSet.mainBlack)
        .fixedSize(horizontal: false, vertical: true)
        .padding(.horizontal)
    }
}
