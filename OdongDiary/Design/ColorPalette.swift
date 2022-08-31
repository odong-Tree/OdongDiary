//
//  ColorSet.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/31.
//

import Foundation
import SwiftUI

enum ColorPalette {
    case red
    case pink
    case orange
    case yellow
    case green
    case blue
    case purple
    
    var color: Color {
        switch self {
        case .red: return Color.red
        case .pink: return Color.pink
        case .orange: return Color.orange
        case .yellow: return Color.yellow
        case .green: return Color.green
        case .blue: return Color.blue
        case .purple: return Color.purple
        }
    }
}

extension ColorPalette: CaseIterable { }

extension Color {
    var first: Color {
        return multiplySaturation(0.7)
    }
    
    var second: Color {
        return multiplySaturation(0.25)
    }
    
    var third: Color {
        return multiplySaturation(0.05)
    }
    
    private func multiplySaturation(_ multiply: CGFloat) -> Color {
        let uiColor = UIColor(self)
        
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        
        if uiColor.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: nil) {
            
        }
        
        let new = UIColor(hue: hue, saturation: saturation * multiply, brightness: brightness, alpha: 1)
        
        return Color(uiColor: new)
    }
}
