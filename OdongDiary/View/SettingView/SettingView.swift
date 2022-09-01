//
//  SettingView.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/28.
//

import Foundation
import SwiftUI

struct SettingView: View {
    @Environment(\.presentationMode) private var presentationMode
    @EnvironmentObject var viewModel: HomeViewModel
    @EnvironmentObject var colorSet: ColorSet
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 80, height: 40)
                        .foregroundColor(colorSet.first())
                        .overlay(Text("완료").foregroundColor(colorSet.mainBlack))
                }
            }
            
            DiaryNameSettingView()
            
            ThemaColorSettingView()
            
            SettingButtonStackView()
            
            Spacer()
        }
        .padding()
        .environmentObject(viewModel)
        .environmentObject(colorSet)
    }
}
