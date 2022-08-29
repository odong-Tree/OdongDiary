//
//  DiaryGridCell.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/28.
//

import Foundation
import SwiftUI

struct DiaryGridCell: View {
    var body: some View {
        GeometryReader { proxy in
            NavigationLink {
                DiaryEditView(type: .read)
            } label: {
                ZStack(alignment: .top) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.yellow.opacity(0.7))
                        .frame(height: proxy.size.height)
                    
                    VStack {
                        Image("infj")
                            .resizable()
                            .frame(height: proxy.size.height * 3/5)
                            .background(Rectangle().foregroundColor(.orange))
                        
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("2022.08.29")
                            
                            Text("MBTI 검사를 했는데 INFJ가 나왔다. INFJ는 밀당을 잘 못하는 MBTI라고 한다. INFJ는 세상에서 가장 멋있는 MBTI다. INFJ는 세상에서 가장 똑똑하다.")
                                .lineLimit(2)
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
