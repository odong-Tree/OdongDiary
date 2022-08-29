//
//  WriteView.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/28.
//

import Foundation
import SwiftUI

struct DiaryEditView: View {
    @StateObject private var viewModel: DiaryEditViewModel = DiaryEditViewModel()
    
    let type: EditViewType

    var body: some View {
        VStack(spacing: 10) {
            HStack {
                NavigationBackButton()
                
                Spacer()
                
                CompleteButton()
            }
            
            GeometryReader { proxy in
                VStack(spacing: 20) {
                    VideoView()
                        .frame(height: proxy.size.width * 9/16)
                    
                    WriteView()
                }
            }
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .padding(.horizontal)
        .padding(.bottom)
        .environmentObject(viewModel)
        .onAppear {
            viewModel.type = type
        }
    }
}
