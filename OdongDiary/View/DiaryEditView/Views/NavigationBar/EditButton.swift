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
    @EnvironmentObject var colorSet: ColorSet
    
    var body: some View {
        Button {
            viewModel.type = .write
        } label: {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(colorSet.second())
                .overlay(Text("편집").foregroundColor(colorSet.mainBlack))
                .frame(width: 80, height: 40)
        }
    }
}
