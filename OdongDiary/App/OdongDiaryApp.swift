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
    @StateObject var colorSet = ColorSet()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .background(colorSet.third())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(HomeViewModel())
                .environmentObject(colorSet)
        }
    }
}
