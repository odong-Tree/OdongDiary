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
    
    init(_ type: EditViewType) {
        viewModel.type = type
    }
    
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
    }
}
