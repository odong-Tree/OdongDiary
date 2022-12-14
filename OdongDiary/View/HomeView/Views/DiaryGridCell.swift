//
//  DiaryGridCell.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/28.
//

import SwiftUI

struct DiaryGridCell: View {
    @EnvironmentObject var viewModel: HomeViewModel
    @EnvironmentObject var colorSet: ColorSet
    
    var diary: DiaryModel
    
    private var didSave = NotificationCenter.default.publisher(for: .NSManagedObjectContextDidSave)
    
    @State private var isRefreshing = false
    
    init(diary: DiaryModel) {
        self.diary = diary
    }
    
    var body: some View {
        GeometryReader { proxy in
            NavigationLink {
                DiaryEditView(type: .read, diary: diary)
                    .environmentObject(colorSet)
            } label: {
                ZStack(alignment: .top) {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: proxy.size.height)
                    
                    VStack(alignment: .leading) {
                        Image(uiImage: diary.thumbnailImage())
                            .resizable()
                            .frame(height: proxy.size.height * 3/5 + (isRefreshing ? 0 : 0))
                        
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(diary.date.convertToString())
                            
                            Text(diary.title + (isRefreshing ? "" : ""))
                                .lineLimit(1)
                            
                            Text(diary.body + (isRefreshing ? "" : ""))
                                .lineLimit(1)
                        }
                        .font(.caption2)
                        .frame(alignment: .leading)
                        .foregroundColor(colorSet.mainBlack)
                    }
                    .padding(10)
                    .background(colorSet.second())
                    .onReceive(self.didSave) { _ in
                        self.isRefreshing.toggle()
                    }
                }
                .cornerRadius(10)
            }
        }
    }
}
