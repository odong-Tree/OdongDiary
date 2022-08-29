//
//  DiaryEditViewModel.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/29.
//

import Foundation

final class DiaryEditViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var body: String = "MBTI 검사를 했는데 INFJ가 나왔다. INFJ는 밀당을 잘 못하는 MBTI라고 한다. INFJ는 세상에서 가장 멋있는 MBTI다. INFJ는 세상에서 가장 똑똑하다."
//    @Published var weather:
    @Published var date: String = ""
}