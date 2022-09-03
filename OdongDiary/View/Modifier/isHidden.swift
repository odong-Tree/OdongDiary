//
//  isHidden.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/31.
//

import SwiftUI

fileprivate struct IsHidden: ViewModifier {
    var isHidden: Bool
    
    func body(content: Content) -> some View {
        if isHidden {
            content.hidden()
        } else {
            content
        }
    }
}

extension View {
    func isHidden(_ bool: Bool) -> some View {
        modifier(IsHidden(isHidden: bool))
    }
}
