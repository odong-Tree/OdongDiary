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
    
    @State private var isShowingSheet: Bool = false
    @State private var isShowingVideoPicker: Bool = false
    
    var body: some View {
        if let videoURL = viewModel.videoURL {
            CustomVideoPlayer(url: videoURL)
        } else {
            RoundedRectangle(cornerRadius: 10)
                .overlay(
                    Button(action: {
                        isShowingSheet = true
                    }, label: {
                        ZStack {
                            Circle()
                                .foregroundColor(ColorSet.main.first())
                            
                            Image(systemName: "plus")
                                .resizable()
                                .foregroundColor(.white)
                                .padding()
                        }
                        .frame(width: 60, height: 60)
                    })
                )
                .confirmationDialog("Video", isPresented: $isShowingSheet) {
                    Button("Album") { isShowingVideoPicker = true}
                    Button("Cancel", role: .cancel) { isShowingSheet = false }
                } message: {
                    Text("Select Video")
                }
                .popover(isPresented: $isShowingVideoPicker) {
                    VideoPickerView { url in
                        viewModel.videoURL = url
                    }
                }
        }
    }
}
