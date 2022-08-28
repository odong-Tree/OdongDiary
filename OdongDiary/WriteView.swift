//
//  WriteView.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/28.
//

import Foundation
import SwiftUI

struct WriteView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        Text("WriteView")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: backButton)
    }
    
    var backButton : some View {
        Button {
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            HStack {
                Image(systemName: "chevron.backward")
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
    
    
}
