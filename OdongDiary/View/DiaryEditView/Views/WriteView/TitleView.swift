//
//  TitleView.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/29.
//

import Foundation
import SwiftUI

struct TitleView: View {
    @EnvironmentObject var viewModel: DiaryEditViewModel
    @EnvironmentObject var colorSet: ColorSet
    
    var body: some View {
        VStack(alignment: .leading, spacing: 7) {
            Text(viewModel.date.convertToString())
                .font(.caption)
            
            TextField("제목을 입력해주세요.", text: $viewModel.title) { }
                .lineLimit(1)
                .font(.title3.bold())
                .disabled(viewModel.type == .read)
        }
        .foregroundColor(.black.opacity(0.5))
    }
}
