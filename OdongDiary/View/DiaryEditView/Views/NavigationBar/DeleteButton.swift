//
//  DeleteButton.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/30.
//

import Foundation
import SwiftUI

struct DeleteButton: View {
    @Environment(\.presentationMode) private var presentationMode
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var viewModel: DiaryEditViewModel
    
    @State var isShowingDeleteAlert: Bool = false
    
    var body: some View {
        Button {
            isShowingDeleteAlert = true
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(ColorSet.main.second())
                    .frame(width: 40, height: 40)
                
                Image(systemName: "trash")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(ColorSet.mainBlack)
            }
        }
        .alert(isPresented: $isShowingDeleteAlert) {
            Alert(title: Text("주의!"),
                  message: Text("삭제하면 복구할 수 없습니다. 정말 삭제하시겠습니까?"),
                  primaryButton: .destructive(Text("OK"), action: {
                let diary = viewModel.makeDiaryModel()

                guard CoreDataManager.delete(viewContext, diary) else {
                    return
                }
                
                try? VideoFileManager.shared.deleteVideo(url: diary.videoURL)
                
                isShowingDeleteAlert = false
                self.presentationMode.wrappedValue.dismiss()
            })
                  , secondaryButton: .cancel())
        }
    }
}
