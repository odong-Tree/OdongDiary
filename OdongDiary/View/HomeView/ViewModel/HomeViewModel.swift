//
//  HomeViewModel.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/30.
//

import SwiftUI

final class HomeViewModel: ObservableObject {
    
    enum SortType {
        case dateAscending
        case dateDesending
        
        var sortDiscriptor: NSSortDescriptor {
            switch self {
            case .dateAscending:
                return NSSortDescriptor(keyPath: \Diary.date, ascending: false)
            case .dateDesending:
                return NSSortDescriptor(keyPath: \Diary.date, ascending: true)
            }
        }
    }
    
    @Published var sortType: SortType = .dateAscending
    @Published var diaryName: String = "Odong Diary"
}
