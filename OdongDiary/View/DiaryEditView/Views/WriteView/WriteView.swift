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
    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            TitleView()
            
            Divider()
            
            if viewModel.type == .write {
                TextEditor(text: $viewModel.body)
                    .background(ColorSet.shared.third())
            } else if viewModel.type == .read {
                ScrollView {
                    Text(viewModel.body)
                }
            }
        }
        .environmentObject(viewModel)
    }
}
