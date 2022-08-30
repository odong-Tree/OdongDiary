//
//  DiaryEditViewModel.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/29.
//

import Foundation
import AVKit

final class DiaryEditViewModel: ObservableObject {
    @Published var videoURL: URL?
    @Published var title: String = "ENFP는 사랑스럽다"
    @Published var body: String = "ENFP는 세상에서 가장 예쁘고 사랑스럽다. 뽀뽀도 잘하고 뽀뽀도 잘한다. ENFP는 세상에서 가장 예쁘고 사랑스럽다. 뽀뽀도 잘하고 뽀뽀도 잘한다. 볼도 부드럽다. ENFP는 세상에서 가장 예쁘고 사랑스럽다. 뽀뽀도 잘하고 뽀뽀도 잘한다. 볼도 부드럽다. ENFP는 세상에서 가장 예쁘고 사랑스럽다. 뽀뽀도 잘하고 뽀뽀도 잘한다. 볼도 부드럽다. ENFP는 세상에서 가장 예쁘고 사랑스럽다. 뽀뽀도 잘하고 뽀뽀도 잘한다. 볼도 부드럽다. ENFP는 세상에서 가장 예쁘고 사랑스럽다. 뽀뽀도 잘하고 뽀뽀도 잘한다. 볼도 부드럽다. ENFP는 세상에서 가장 예쁘고 사랑스럽다. 뽀뽀도 잘하고 뽀뽀도 잘한다. 볼도 부드럽다. ENFP는 세상에서 가장 예쁘고 사랑스럽다. 뽀뽀도 잘하고 뽀뽀도 잘한다. 볼도 부드럽다. ENFP는 세상에서 가장 예쁘고 사랑스럽다. 뽀뽀도 잘하고 뽀뽀도 잘한다. 볼도 부드럽다. ENFP는 세상에서 가장 예쁘고 사랑스럽다. 뽀뽀도 잘하고 뽀뽀도 잘한다. 볼도 부드럽다. ENFP는 세상에서 가장 예쁘고 사랑스럽다. 뽀뽀도 잘하고 뽀뽀도 잘한다. 볼도 부드럽다. ENFP는 세상에서 가장 예쁘고 사랑스럽다. 뽀뽀도 잘하고 뽀뽀도 잘한다. 볼도 부드럽다. ENFP는 세상에서 가장 예쁘고 사랑스럽다. 뽀뽀도 잘하고 뽀뽀도 잘한다. 볼도 부드럽다. ENFP는 세상에서 가장 예쁘고 사랑스럽다. 뽀뽀도 잘하고 뽀뽀도 잘한다. 볼도 부드럽다."

    @Published var date: String = "2022.08.29"
    
    @Published var type: EditViewType = .write
}
