//
//  BodyTextEditor.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/09/03.
//

import SwiftUI

struct BodyTextEditor: View {
    @EnvironmentObject var viewModel: DiaryEditViewModel
    @EnvironmentObject var colorSet: ColorSet
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            if viewModel.body.isEmpty {
                Text("내용을 입력하세요.")
                    .foregroundColor(colorSet.mainBlack.opacity(0.5))
            }
            
            if viewModel.type == .write {
                TextEditor(text: $viewModel.body)
                    .lineSpacing(1.9)
                    .background(.clear)
            } else if viewModel.type == .read {
                ScrollView {
                    Text(viewModel.body)
                }
            }
        }
    }
}
