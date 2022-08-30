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
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(viewModel.date)
                .font(.caption)
            
            TextField(text: $viewModel.title) { }
                .lineLimit(1)
                .font(.title2.bold())
                .disabled(viewModel.type == .read)
        }
        .foregroundColor(.black.opacity(0.5))
    }
}
