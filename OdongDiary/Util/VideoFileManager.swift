//
//  VideoFileManager.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/31.
//

import Foundation

final class VideoFileManager {
    static let shared = VideoFileManager()
    
    static private let userDefaultsKey: String = "OdongDiary_folderURL"
    private let folderURL: URL
    
    private init() {
        self.folderURL = VideoFileManager.setFolderURL()
    }
    
    static private func setFolderURL() -> URL {
        var url: URL! = UserDefaults.standard.url(forKey: userDefaultsKey)
        
        while url == nil {
            url = URL.createFolder(folderName: "OdongDiary_" + UUID().uuidString.prefix(6))
        }
        
        UserDefaults.standard.set(url, forKey: userDefaultsKey)
        
        return url
    }
    
    func writeVideo(from albumURL: URL, fileName: String) throws -> URL {
        let saveURL = folderURL.appendingPathComponent(fileName).appendingPathExtension("mov")
        let videoData = try Data(contentsOf: albumURL)
        try videoData.write(to: saveURL, options: .atomic)
        
        return saveURL
    }
    
    func deleteVideo(url: URL) throws {
        if FileManager.default.fileExists(atPath: url.path) {
            try FileManager.default.removeItem(at: url)
        }
    }
    
    func fileURL(fileName: String) -> URL {
        let url = folderURL.appendingPathComponent(fileName).appendingPathExtension("mov")
        return url
    }
    
    func clearFolder() {
        do {
            let urls = try FileManager.default.contentsOfDirectory(at: folderURL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            
            for url in urls {
                try deleteVideo(url: url)
            }
        } catch {
            print(error)
        }
        
    }
}
