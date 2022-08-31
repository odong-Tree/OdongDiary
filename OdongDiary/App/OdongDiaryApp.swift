//
//  OdongDiaryApp.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/28.
//

import SwiftUI

@main
struct OdongDiaryApp: App {
    
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .background(ColorSet.shared.third())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(HomeViewModel())
        }
    }
}
