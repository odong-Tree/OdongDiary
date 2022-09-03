//
//  ImagePicker.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/30.
//

import SwiftUI
import AVFoundation

struct VideoPickerView: UIViewControllerRepresentable {
    @Environment(\.presentationMode) private var presentationMode
    
    let videoPicked: (URL) -> ()
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
    
    func makeUIViewController(context: Context) -> some UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.mediaTypes = ["public.movie"]
        
        picker.allowsEditing = true

        return picker
    }
}

// MARK: Coordinator
extension VideoPickerView {
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        let parent: VideoPickerView
        
        init(parent: VideoPickerView) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            guard let url = info[UIImagePickerController.InfoKey(rawValue: UIImagePickerController.InfoKey.mediaURL.rawValue)] as? URL else {
                
                return
            }
            
            parent.videoPicked(url)
            parent.presentationMode.wrappedValue.dismiss()
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
