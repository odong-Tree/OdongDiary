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
    case blue
    case purple
    
    var color: Color {
        switch self {
        case .red: return Color.red
        case .pink: return Color.pink
        case .orange: return Color.orange
        case .yellow: return Color.yellow
        case .blue: return Color.blue
        case .purple: return Color.purple
        }
    }
}

extension Color {
    var first: Color {
        return multiplySaturation(0.8)
    }
    
    var second: Color {
        return multiplySaturation(0.5)
    }
    
    var third: Color {
        return multiplySaturation(0.2)
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

//struct ColorButton: View {
//    let thema: ColorPalette
//    let action: (ColorPalette) -> Void
//    
//    var body: some View {
//        Button {
//            action(thema)
//        } label: {
//            RoundedRectangle(cornerRadius: 10)
//                .frame(width: 30, height: 30)
//                .foregroundColor(thema.color.second)
//        }
//    }
//}
//
//struct SampleView: View {
//    @State var main: ColorPalette = .blue
//    var body: some View {
//        
//        VStack {
//            HStack {
//                ColorButton(thema: .orange) { color in
//                    main = color
//                }
//                ColorButton(thema: .pink) { color in
//                    main = color
//                }
////                ColorButton(thema: .gray) { color in
////                    main = color
////                }
////                ColorButton(thema: .black) { color in
////                    main = color
////                }
//                ColorButton(thema: .red) { color in
//                    main = color
//                }
//            }
//            
//            HStack {
//                ColorButton(thema: .blue) { color in
//                    main = color
//                }
////                ColorButton(thema: .brown) { color in
////                    main = color
////                }
//                ColorButton(thema: .purple) { color in
//                    main = color
//                }
////                ColorButton(thema: .indigo) { color in
////                    main = color
////                }
//                ColorButton(thema: .yellow) { color in
//                    main = color
//                }
//                
//            }
//            
//            Divider()
//            
//            HStack {
//                RoundedRectangle(cornerRadius: 10)
//                    .frame(width: 50, height: 50)
//                    .foregroundColor(main.color.first)
//                
//                RoundedRectangle(cornerRadius: 10)
//                    .frame(width: 50, height: 50)
//                    .foregroundColor(main.color.second)
//                
//                RoundedRectangle(cornerRadius: 10)
//                    .frame(width: 50, height: 50)
//                    .foregroundColor(main.color.third)
//            }
//        }
//    }
//}
//
//struct Preview_SampleView: PreviewProvider {
//    static var previews: some View {
//        SampleView()
//    }
//}
