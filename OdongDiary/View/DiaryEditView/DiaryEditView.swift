//
//  WriteView.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/28.
//

import Foundation
import SwiftUI

struct DiaryEditView: View {
    @Environment(\.managedObjectContext) var viewContext
    @StateObject private var viewModel: DiaryEditViewModel = DiaryEditViewModel()
    
    let type: EditViewType
    let diary: DiaryModel?

    var body: some View {
        VStack(spacing: 10) {
            HStack {
                NavigationBackButton()
                
                Spacer()
                
                switch viewModel.type {
                case .write:
                    HStack {
                        DeleteButton()
                        CompleteButton()
                    }
                case .read: EditButton()
                }
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
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .padding(.horizontal)
        .padding(.bottom)
        .environmentObject(viewModel)
        .onAppear {
            viewModel.type = type
            
            if let diary = diary {
                viewModel.readDiary(diary)
            }
        }
    }
}
