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
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 80, height: 40)
                        .foregroundColor(ColorSet.main.first())
                        .overlay(Text("완료").foregroundColor(ColorSet.mainBlack))
                }
            }
            
            DiaryNameSettingView()
            
            ThemaColorSettingView()
            
            Spacer()
        }
        .padding()
    }
}
