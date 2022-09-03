//
//  ContentView.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/28.
//

import SwiftUI
import CoreData

struct HomeView: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var viewModel: HomeViewModel
    @EnvironmentObject var colorSet: ColorSet
    
    var body: some View {
        NavigationView {
            VStack {
                TitleStackView()
                
                ZStack {
                    DiaryGridView(sortDescriptor: viewModel.sortType.sortDiscriptor)
                    
                    VStack {
                        Spacer()
                        
                        NavigationLink {
                            DiaryEditView(type: .write, diary: nil)
                        } label: {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(colorSet.first())
                                .frame(width: 300, height: 60)
                                .overlay(
                                    Text("일기쓰기")
                                        .font(.title3).foregroundColor(colorSet.mainBlack)
                                         )
                        }
                    }
                }
                .padding(.horizontal)
            }
            .navigationBarHidden(true)
            .background(colorSet.third())
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
