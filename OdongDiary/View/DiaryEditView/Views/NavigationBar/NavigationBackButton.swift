//
//  NavigationBackButton.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/29.
//

import Foundation
import SwiftUI

struct NavigationBackButton: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var viewModel: DiaryEditViewModel
    
    @State var isShowingBackButtonAlert: Bool = false
    
    private let action: (() -> Void)?
    
    init(action: (() -> Void)? = nil) {
        self.action = action
    }
    
    var body: some View {
        Button {            
            if viewModel.type == .write {
                isShowingBackButtonAlert = true
            } else {
                self.presentationMode.wrappedValue.dismiss()
            }
            
            if let action = self.action {
                action()
            }
        } label: {
            Image(systemName: "chevron.backward")
                .resizable()
                .frame(width: 20, height: 20)
                .aspectRatio(contentMode: .fit)
        }
        .alert(isPresented: $isShowingBackButtonAlert) {
            Alert(title: Text("주의!"),
                  message: Text("변경한 내용은 저장되지 않습니다. 돌아가시겠습니까?"),
                  primaryButton: .default(Text("OK"), action: {
                isShowingBackButtonAlert = false
                self.presentationMode.wrappedValue.dismiss()
            })
                  , secondaryButton: .cancel())
        }
    }
}
