//
//  ThemaColorSettingView.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/31.
//

import Foundation
import SwiftUI

struct ThemaColorSettingView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    
    var body: some View {
        ZStack {
            ColorSet.main.third()
            
            VStack(alignment: .leading) {
                Text("Thema Color")
                    .foregroundColor(ColorSet.mainBlack)
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
    }
}
