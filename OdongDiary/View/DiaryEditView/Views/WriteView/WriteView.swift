//
//  WriteView.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/29.
//

import SwiftUI

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
            
            BodyTextEditor()
        }
    }
}
