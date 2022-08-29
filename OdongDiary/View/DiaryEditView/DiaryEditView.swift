//
//  WriteView.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/28.
//

import Foundation
import SwiftUI

struct DiaryEditView: View {
    @StateObject var viewModel: DiaryEditViewModel = DiaryEditViewModel()
    
    var body: some View {
        VStack {
            HStack {
                NavigationBackButton()
                
                Spacer()
                
                CompleteButton()
            }
            
            Spacer()
            
            VStack {
                VideoView()
                
                WriteView()
                    .environmentObject(viewModel)
            }
            Text("DiaryEditView")
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .padding(.horizontal)
    }
}
