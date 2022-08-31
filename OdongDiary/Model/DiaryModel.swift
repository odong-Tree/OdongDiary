//
//  Diary.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/28.
//

import Foundation
import SwiftUI

struct DiaryModel {
    let id: String
    var title: String
    var body: String
    var date: Date
    var videoURL: URL
    var fileName: String
    
    init(id: String, title: String, body: String, date: Date, videoURL: URL, fileName: String) {
        self.id = id
        self.title = title
        self.body = body
        self.date = date
        self.videoURL = videoURL
        self.fileName = fileName
    }
    
    init(fetchResult: FetchedResults<Diary>.Element) {
        self.id = fetchResult.id
        self.title = fetchResult.title
        self.body = fetchResult.body
        self.date = fetchResult.date
        self.fileName = fetchResult.fileName
        self.videoURL = VideoFileManager.shared.fileURL(fileName: fileName)
    }
}
