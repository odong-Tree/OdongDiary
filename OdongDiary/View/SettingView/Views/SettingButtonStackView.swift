//
//  DeleteAllDiaryButton.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/09/01.
//

import SwiftUI

struct SettingButtonStackView: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var colorSet: ColorSet
    
    @State var isShowingDeleteAllDataAlert: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            SettingButton(name: "일기장 초기화") {
                isShowingDeleteAllDataAlert = true
            }
            .alert(isPresented: $isShowingDeleteAllDataAlert) {
                Alert(title: Text("주의!"),
                      message: Text("삭제하면 복구할 수 없습니다. 정말 모든 데이터를 삭제하시겠습니까?"),
                      primaryButton: .destructive(Text("OK"), action: {
                    CoreDataManager.clearAllData(context: viewContext)
                    VideoFileManager.shared.clearFolder()
                    
                    isShowingDeleteAllDataAlert = false
                })
                      , secondaryButton: .cancel())
            }
            
            Divider()
                .padding(.horizontal)
            
            SettingButton(name: "Github 저장소로 이동") {
                // Move to Github Repository
            }
        }
        .cornerRadius(10)
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct SettingButton: View {
    @EnvironmentObject var colorSet: ColorSet
    
    let name: String
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack(alignment: .leading) {
                colorSet.third()
                
                Text(name)
                    .foregroundColor(colorSet.mainBlack.opacity(0.8))
                    .padding()
            }
            
        }
    }
}
