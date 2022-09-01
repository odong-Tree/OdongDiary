//
//  DeleteAllDiaryButton.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/09/01.
//

import Foundation
import SwiftUI

struct SettingButtonStackView: View {
    @EnvironmentObject var colorSet: ColorSet
    
    var body: some View {
        VStack(spacing: 0) {
            SettingButton(name: "일기장 초기화") {
                // Delete All Diary
            }
            
            Divider()
                .padding(.horizontal)
            
            SettingButton(name: "Github 저장소로 이동") {
                // Move to Github Repository
            }
        }
        .cornerRadius(10)
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct SettingButton: View {
    @EnvironmentObject var colorSet: ColorSet
    
    let name: String
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack(alignment: .leading) {
                colorSet.third()
                
                Text(name)
                    .foregroundColor(colorSet.mainBlack.opacity(0.8))
                    .padding()
            }
            
        }
    }
}
