//
//  PaletteView.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/31.
//

import SwiftUI

struct ColorButton: View {
    @EnvironmentObject var colorSet: ColorSet
    
    let thema: ColorPalette
    let action: (ColorPalette) -> Void
    
    var body: some View {
        Button {
            action(thema)
        } label: {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 35, height: 35)
                .foregroundColor(thema.color.second)
        }
    }
}

struct PaletteView: View {
    @EnvironmentObject var colorSet: ColorSet
    
    var body: some View {
        HStack {
            ForEach(ColorPalette.allCases, id: \.color) { i in
                ColorButton(thema: i) { color in
                    colorSet.change(to: color)
                }
            }
        }
    }
}
