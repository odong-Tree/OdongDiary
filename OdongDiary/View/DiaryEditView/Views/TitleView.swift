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
        VStack {
            Text(viewModel.date)
                .font(.body)
            
            Text(viewModel.title)
                .font(.title3)
        }
        .foregroundColor(.white)
    }
}
