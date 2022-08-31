//
//  CompleteButton.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/29.
//

import Foundation
import SwiftUI

struct CompleteButton: View {
    @Environment(\.presentationMode) private var presentationMode
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var viewModel: DiaryEditViewModel
    
    var body: some View {
        Button {
            let diary = viewModel.makeDiaryModel()
            
            if CoreDataManager.hasObject(viewContext, of: diary) {
                let old = CoreDataManager.fetch(viewContext, of: diary.id)
                guard let oldURL = old.value(forKey: "videoURL") as? URL else {
                    return
                }
                
                guard CoreDataManager.update(viewContext, diary) else {
                    return
                }
                
                if oldURL != diary.videoURL {
                    try? VideoFileManager.shared.deleteVideo(url: oldURL)
                    let new = try? VideoFileManager.shared.writeVideo(from: diary.videoURL, fileName: "\(diary.title)")
                    viewModel.videoURL = new
                }
            } else {
                let newFileName = "\(diary.title)_\(UUID().uuidString.prefix(6))"
                let newURL = try? VideoFileManager.shared.writeVideo(from: diary.videoURL, fileName: newFileName)
                
                viewModel.fileName = newFileName
                viewModel.videoURL = newURL
                
                CoreDataManager.save(viewContext, viewModel.makeDiaryModel())
            }
            
            presentationMode.wrappedValue.dismiss()
        } label: {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(ColorSet.main.first())
                .overlay(Text("완료").foregroundColor(ColorSet.mainBlack))
                .frame(width: 80, height: 40)
        }
        .disabled(!isActive())
    }
    
    private func isActive() -> Bool {
        return viewModel.videoURL != nil && viewModel.title != "" && viewModel.body != ""
    }
}
