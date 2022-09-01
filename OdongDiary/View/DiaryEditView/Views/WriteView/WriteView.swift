//
//  WriteView.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/29.
//

import Foundation
import SwiftUI

struct WriteView: View {
    @EnvironmentObject var viewModel: DiaryEditViewModel
    @EnvironmentObject var colorSet: ColorSet
    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            TitleView()
            
            Divider()
            
            ZStack(alignment: .topLeading) {
                if viewModel.type == .write {
                    TextEditor(text: $viewModel.body)
                        .background(colorSet.third())
                } else if viewModel.type == .read {
                    ScrollView {
                        Text(viewModel.body)
                    }
                }
                
                if viewModel.body == "" {
                    Text("내용을 입력하세요.")
                        .foregroundColor(colorSet.mainBlack.opacity(0.5))
                }
            }
            

        }
        .environmentObject(viewModel)
        .environmentObject(colorSet)
    }
}
