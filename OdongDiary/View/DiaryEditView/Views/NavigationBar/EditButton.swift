//
//  EditButton.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/30.
//

import Foundation
import SwiftUI

struct EditButton: View {
    @EnvironmentObject var viewModel: DiaryEditViewModel
    
    var body: some View {
        Button {
            viewModel.type = .write
        } label: {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(ColorSet.shared.second())
                .overlay(Text("편집").foregroundColor(ColorSet.mainBlack))
                .frame(width: 80, height: 40)
        }
    }
}
