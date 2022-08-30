//
//  CompleteButton.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/29.
//

import Foundation
import SwiftUI

struct CompleteButton: View {
    @Environment(\.presentationMode) private var presentationMode
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var viewModel: DiaryEditViewModel
    
    var body: some View {
        Button {
            // CoreData CRUD
            CoreDataManager.save(viewContext, viewModel.model())
            presentationMode.wrappedValue.dismiss()
        } label: {
            RoundedRectangle(cornerRadius: 10)
                .overlay(Text("완료").foregroundColor(.white))
                .frame(width: 80, height: 40)
        }
        .disabled(!isActive())
    }
    
    private func isActive() -> Bool {
        return viewModel.videoURL != nil && viewModel.title != "" && viewModel.body != ""
    }
}
