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
            
            BodyTextEditor()
        }
    }
}
