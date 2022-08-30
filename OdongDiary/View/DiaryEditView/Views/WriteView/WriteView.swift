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
    
    var body: some View {
        VStack(alignment: .leading) {
            TitleView()
            
            if viewModel.type == .write {
                TextEditor(text: $viewModel.body)
            } else if viewModel.type == .read {
                ScrollView {
                    Text(viewModel.body)
                }
            }
        }
        .environmentObject(viewModel)
    }
}
