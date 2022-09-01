//
//  WriteView.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/29.
//

import Foundation
import SwiftUI
import UIKit

struct WriteView: View {
    @EnvironmentObject var viewModel: DiaryEditViewModel
    @EnvironmentObject var colorSet: ColorSet
    
    init() {
        UITextView.appearance().backgroundColor = .clear
        
        UITextView.appearance().textContainerInset = UIEdgeInsets(top: 0, left: -5, bottom: 0, right: 0)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            TitleView()
            
            Divider()
            
            ZStack(alignment: .topLeading) {
                if viewModel.type == .write {
                    TextEditor(text: $viewModel.body)
                        .lineSpacing(1.9)
                        .background(colorSet.third())
                } else if viewModel.type == .read {
                    ScrollView {
                        Text(viewModel.body)
                    }
                }
                
                if viewModel.body == "" {
                    Text("내용을 입력하세요.")
                        .foregroundColor(colorSet.mainBlack.opacity(0.5))
                }
            }
            

        }
        .environmentObject(viewModel)
        .environmentObject(colorSet)
    }
}
