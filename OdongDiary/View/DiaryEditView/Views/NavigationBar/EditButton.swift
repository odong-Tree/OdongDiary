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
                .foregroundColor(.orange)
                .overlay(Text("편집").foregroundColor(.white))
                .frame(width: 80, height: 40)
        }
    }
}
