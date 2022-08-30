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
    
    init(id: String, title: String, body: String, date: Date, videoURL: URL) {
        self.id = id
        self.title = title
        self.body = body
        self.date = date
        self.videoURL = videoURL
    }
    
    init(fetchResult: FetchedResults<Diary>.Element) {
        self.id = fetchResult.id
        self.title = fetchResult.title
        self.body = fetchResult.body
        self.date = fetchResult.date
        self.videoURL = fetchResult.videoURL
    }
}
