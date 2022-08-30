//
//  DiaryGridView.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/28.
//

import Foundation
import SwiftUI


struct DiaryGridView: View {
    @FetchRequest(sortDescriptors: [], animation: .default)
    private var diaryList: FetchedResults<Diary>
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(diaryList, id: \.self) { diary in
                    DiaryGridCell(diary: DiaryModel(fetchResult: diary))
                        .frame(height: UIScreen.main.bounds.height * 0.25)
                }
            }
        }
    }
}
