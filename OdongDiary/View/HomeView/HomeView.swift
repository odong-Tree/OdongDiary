//
//  ContentView.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/28.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Button {
                        
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
                    DiaryGridView()
                    
                    VStack {
                        Spacer()
                        
                        NavigationLink {
                            DiaryEditView(type: .write)
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
        }
        .padding(.horizontal)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
