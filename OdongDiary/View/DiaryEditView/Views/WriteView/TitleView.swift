//
//  TitleView.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/29.
//

import SwiftUI

struct TitleView: View {
    @EnvironmentObject var viewModel: DiaryEditViewModel
    @EnvironmentObject var colorSet: ColorSet
    
    var body: some View {
        VStack(alignment: .leading, spacing: 7) {
            Text(viewModel.date.convertToString())
                .font(.caption)
            
            TitleTextEditor()
            
            Divider()
        }
        .foregroundColor(.black.opacity(0.5))
    }
}
