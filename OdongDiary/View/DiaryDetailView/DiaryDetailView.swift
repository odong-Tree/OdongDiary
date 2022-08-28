//
//  DiaryDetailView.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/28.
//

import Foundation
import SwiftUI

struct DiaryDetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        Text("DiaryDetailView")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: NavigationBackButton())
    }
}
