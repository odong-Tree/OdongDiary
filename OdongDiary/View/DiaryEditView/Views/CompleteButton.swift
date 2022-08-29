//
//  CompleteButton.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/29.
//

import Foundation
import SwiftUI

struct CompleteButton: View {
    var body: some View {
        Button {
            // CoreData CRUD
        } label: {
            RoundedRectangle(cornerRadius: 10)
                .overlay(Text("완료").foregroundColor(.white))
                .frame(width: 80, height: 40)
        }
    }
}
