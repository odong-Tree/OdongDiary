//
//  DeleteButton.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/30.
//

import Foundation
import SwiftUI

struct DeleteButton: View {
    @Environment(\.presentationMode) private var presentationMode
    @EnvironmentObject var viewModel: DiaryEditViewModel
    
    var body: some View {
        Button {
            // CoreData CRUD
            presentationMode.wrappedValue.dismiss()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.brown)
                    .frame(width: 40, height: 40)
                
                Image(systemName: "trash")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
            }
            
        }
    }
}
