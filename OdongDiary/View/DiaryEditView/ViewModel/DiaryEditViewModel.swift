//
//  DiaryEditViewModel.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/29.
//

import Foundation
import AVKit

final class DiaryEditViewModel: ObservableObject {
    @Published var videoURL: URL!
    @Published var title: String = "" {
        didSet {
            let limit = 15
            if title.count > limit {
                title = String(title.prefix(limit))
            }
        }
    }
    @Published var body: String = "" {
        didSet {
            let limit = 500
            if body.count > limit {
                body = String(body.prefix(limit))
            }
        }
    }
    @Published var id: String = UUID().uuidString
    @Published var date: Date = Date()
    var fileName: String = ""
    
    @Published var type: EditViewType = .write
    
    func makeDiaryModel() -> DiaryModel {
        return DiaryModel(id: id, title: title, body: body, date: date, videoURL: videoURL, fileName: fileName)
    }
    
    func readDiary(_ diary: DiaryModel) {
        self.id = diary.id
        self.title = diary.title
        self.body = diary.body
        self.date = diary.date
        self.videoURL = diary.videoURL
        self.fileName = diary.fileName
    }
}
