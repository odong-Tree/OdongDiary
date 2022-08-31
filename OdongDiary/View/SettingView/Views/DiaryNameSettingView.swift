//
//  DiaryNameSettingView.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/31.
//

import Foundation
import SwiftUI

struct DiaryNameSettingView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    @EnvironmentObject var colorSet: ColorSet
    
    var body: some View {
        ZStack {
            colorSet.third()
            
            VStack(alignment: .leading) {
                Text("Diary Name")
                    .foregroundColor(colorSet.mainBlack)
                    .font(.caption)
                
                TextField("Diary Name", text: $viewModel.diaryName)
                
                Divider()
            }
            .padding()
        }
        .cornerRadius(10)
        .fixedSize(horizontal: false, vertical: true)
    }
}
