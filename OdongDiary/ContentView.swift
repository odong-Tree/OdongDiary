//
//  ContentView.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Button("Filter") {
                        
                    }
                    
                    Spacer()
                    
                    Text("Odong Diary")
                    
                    Spacer()
                    
                    NavigationLink {
                        SettingView()
                    } label: {
                        Image(systemName: "gearshape.fill")
                        
                        Image(systemName: "person.circle.fill")
                    }

                }
                
                Spacer()
                
                NavigationLink {
                    WriteView()
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 300, height: 50)
                        .overlay(Text("일기쓰기").foregroundColor(.white))
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
