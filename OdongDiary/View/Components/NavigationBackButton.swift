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
    
    private let action: (() -> Void)?
    
    init(action: (() -> Void)? = nil) {
        self.action = action
    }
    
    var body: some View {
        Button {
            self.presentationMode.wrappedValue.dismiss()
            
            if let action = self.action {
                action()
            }
        } label: {
            HStack {
                Image(systemName: "chevron.backward")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
}
