//
//  DiaryGridView.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/28.
//

import Foundation
import SwiftUI

struct DiaryGridView: View {
    let data = Array(1...100)
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(data, id: \.self) { i in
                    DiaryGridCell()
                        .frame(height: UIScreen.main.bounds.height * 0.25)
                }
            }
        }
    }
}
