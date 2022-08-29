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
        VStack {
            HStack {
                NavigationBackButton()
                
                Spacer()
                
                CompleteButton()
            }
            
            Spacer()
            
            GeometryReader { proxy in
                VStack {
                    VideoView()
                        .frame(height: proxy.size.width * 9/16)
                    
                    WriteView()
                        .background(Rectangle().foregroundColor(.gray))
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
