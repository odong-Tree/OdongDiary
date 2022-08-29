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
        ScrollView {
            VStack {
//                TitleView()
                
//                BodyView()
                TextEditor(text: $viewModel.body)
            }
        }
    }
}
