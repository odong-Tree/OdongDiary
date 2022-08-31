//
//  ThemaColor.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/31.
//

import Foundation
import SwiftUI

final class ColorSet {
    static let shared = ColorSet()
    static let mainBlack = Color.black.opacity(0.6)
    
    private init() { }
    
    private var main: ColorPalette = .yellow
    
    func first() -> Color {
        main.color.first
    }
    
    func second() -> Color {
        main.color.second
    }
    
    func third() -> Color {
        main.color.third
    }
    
    func change(to color: ColorPalette) {
        main = color
    }
}
