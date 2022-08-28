//
//  DiaryGridView.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/28.
//

import Foundation
import SwiftUI

struct DiaryGridView: View {
    let data = Array(1...100).map { "목록 \($0)" }
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(data, id: \.self) { i in
                    DiaryGridCell()
                }
            }
        }
    }
}
