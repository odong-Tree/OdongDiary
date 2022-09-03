//
//  TitleTextEditor.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/09/03.
//

import SwiftUI

struct TitleTextEditor: View {
    @EnvironmentObject var viewModel: DiaryEditViewModel
    @EnvironmentObject var colorSet: ColorSet
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            if viewModel.title.isEmpty {
                Text("제목을 입력하세요.")
                    .font(.title3.bold())
                    .foregroundColor(colorSet.mainBlack.opacity(0.5))
            }
            
            if viewModel.type == .write {
                TextEditor(text: $viewModel.title)
                    .lineSpacing(1.9)
                    .lineLimit(1)
                    .font(.title3.bold())
                    .disabled(viewModel.type == .read)
                    .background(.clear)
                    .frame(height: 25)
            } else if viewModel.type == .read {
                ScrollView {
                    Text(viewModel.title)
                        .font(.title3.bold())
                }
                .fixedSize()
            }
        }
    }
}
