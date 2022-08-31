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
    
    @State var isShowingSettingView: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Menu {
                        Button("최신순") { viewModel.sortType = .dateAscending }
                        Button("오래된순") { viewModel.sortType = .dateDesending }
                    } label: {
                        Image(systemName: "line.3.horizontal.decrease")
                    }
                    
                    Spacer()
                    
                    Text(viewModel.diaryName)
                        .font(.title)
                    
                    Spacer()
                    
                    Button {
                        isShowingSettingView = true
                    } label: {
                        Image(systemName: "gearshape.fill")
                    }
                    .popover(isPresented: $isShowingSettingView) {
                        SettingView()
                            .background(colorSet.second())
                    }
                }
                .foregroundColor(colorSet.mainBlack)
                .padding(.horizontal)
                
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
            .environmentObject(viewModel)
            .environmentObject(colorSet)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
