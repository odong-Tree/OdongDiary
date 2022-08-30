//
//  DiaryGridCell.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/28.
//

import Foundation
import SwiftUI

struct DiaryGridCell: View {
    @State var diary: DiaryModel
    
    var body: some View {
        GeometryReader { proxy in
            NavigationLink {
                DiaryEditView(type: .read, diary: diary)
            } label: {
                ZStack(alignment: .top) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.yellow.opacity(0.7))
                        .frame(height: proxy.size.height)
                    
                    VStack(alignment: .leading) {
                        Image(systemName: "pencil")
                            .resizable()
                            .frame(height: proxy.size.height * 3/5)
                            .background(Rectangle().foregroundColor(.orange))
                        
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("2022.08.29")
                            
                            Text(diary.title)
                                .lineLimit(1)
                            
                            Text(diary.body)
                                .lineLimit(1)
                        }
                        .font(.caption2)
                        .frame(alignment: .leading)
                        .foregroundColor(.black.opacity(0.5))
                    }
                    .padding(10)
                }
            }
        }
    }
}
