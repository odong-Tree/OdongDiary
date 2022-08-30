//
//  DiaryEditViewModel.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/29.
//

import Foundation
import AVKit

final class DiaryEditViewModel: ObservableObject {
    @Published var videoURL: URL?
    @Published var title: String = ""
    @Published var body: String = ""

    @Published var date: Date = Date()
    
    @Published var type: EditViewType = .write
    
    func model() -> DiaryModel {
        return DiaryModel(id: UUID().uuidString, title: title, body: body, date: Date(), videoURL: videoURL!)
    }
    
    func readDiary(_ diary: DiaryModel) {
        self.title = diary.title
        self.body = diary.body
        self.date = diary.date
        self.videoURL = diary.videoURL
    }
    
//    func clearDiary() {
//        self.title = ""
//        self.body = ""
//        self.date = Date()
//        self.videoURL = nil
//    }
}
