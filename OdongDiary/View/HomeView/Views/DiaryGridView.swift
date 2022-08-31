//
//  DiaryGridView.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/28.
//

import Foundation
import SwiftUI
import CoreData

let sortDecriptorsKey = "sortDescriptors"

struct DiaryGridView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    
    @FetchRequest private var diaryList: FetchedResults<Diary>
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    init(sortDescriptor: NSSortDescriptor) {
        _diaryList = FetchRequest(entity: Diary.entity(), sortDescriptors: [sortDescriptor])
    }
    
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
