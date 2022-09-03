//
//  ThemaColorSettingView.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/31.
//

import SwiftUI

struct ThemaColorSettingView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    @EnvironmentObject var colorSet: ColorSet
    
    var body: some View {
        ZStack {
            colorSet.third()
            
            VStack(alignment: .leading) {
                Text("Thema Color")
                    .foregroundColor(colorSet.mainBlack)
                    .font(.caption)
                
                HStack {
                    Spacer()
                    
                    PaletteView()
                    
                    Spacer()
                }
            }
            .padding()
        }
        .cornerRadius(10)
        .fixedSize(horizontal: false, vertical: true)
        .environmentObject(colorSet)
    }
}
