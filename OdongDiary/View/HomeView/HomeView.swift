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
                    
                    Text("Odong Diary")
                        .font(.title)
                    
                    Spacer()
                    
                    NavigationLink {
                        SettingView()
                    } label: {
                        Image(systemName: "gearshape.fill")
                    }
                }
                .foregroundColor(.black)
                
                ZStack {
                    DiaryGridView(sortDescriptor: viewModel.sortType.sortDiscriptor)
                    
                    VStack {
                        Spacer()
                        
                        NavigationLink {
                            DiaryEditView(type: .write, diary: nil)
                        } label: {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color(hue: 0.294, saturation: 0.518, brightness: 0.789))
                                .frame(width: 300, height: 60)
                                .overlay(
                                    Text("일기쓰기")
                                        .font(.title3).foregroundColor(.white)
                                         )
                        }
                    }
                }
            }
            .navigationBarHidden(true)
            .environmentObject(viewModel)
        }
        .padding(.horizontal)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
