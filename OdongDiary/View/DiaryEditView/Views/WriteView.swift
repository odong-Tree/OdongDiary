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
            
            TextEditor(text: $viewModel.body)
                .background(Rectangle().foregroundColor(.green))
                .disabled(viewModel.type == .read)
        }
    }
}
