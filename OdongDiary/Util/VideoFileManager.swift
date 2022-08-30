//
//  VideoFileManager.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/31.
//

import Foundation

final class VideoFileManager {
    static let shared = VideoFileManager()
    
    private let folderURL: URL
    
    private init() {
        self.folderURL = VideoFileManager.makeFolder()
    }
    
    static private func makeFolder() -> URL {
        var url: URL!
        
        while url == nil {
            url = URL.createFolder(folderName: "OdongDiary_" + UUID().uuidString.prefix(6))
        }
        
        return url
    }
}
