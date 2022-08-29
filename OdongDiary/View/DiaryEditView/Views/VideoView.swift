//
//  VideoView.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/29.
//

import Foundation
import SwiftUI
import AVKit

struct VideoView: View {
    @EnvironmentObject var viewModel: DiaryEditViewModel
    
    var body: some View {
        if let video = viewModel.video {
            VideoPlayer(player: AVPlayer(playerItem: video))
        } else if let image = viewModel.image {
            Image(uiImage: image)
        } else {
            RoundedRectangle(cornerRadius: 10)
                .overlay(
                    Button(action: {
                        // Image Picker
                    }, label: {
                        ZStack {
                            Circle()
                                .frame(width: 60, height: 60)
                            
                            Image(systemName: "plus")
                        }
                    })
                )
        }
    }
}
