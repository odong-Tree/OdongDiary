//
//  ThemaColor.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/31.
//

import Foundation
import SwiftUI

final class ColorSet: ObservableObject {
    let mainBlack = Color.black.opacity(0.6)
    
    @Published var thema: ColorPalette = .yellow
    
    func first() -> Color {
        thema.color.first
    }

    func second() -> Color {
        thema.color.second
    }

    func third() -> Color {
        thema.color.third
    }
    
    func change(to color: ColorPalette) {
        thema = color
    }
}
