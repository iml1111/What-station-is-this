//
//  ContentView.swift
//  What-station-is-this
//
//  Created by 신희재 on 2021/03/14.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        // navigation view 설정
        let navBarAppearance = UINavigationBar.appearance()

        // 본문 타이틀 텍스트를 컬러
        navBarAppearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        // 헤더 타이틀 텍스트 컬러
        navBarAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        
        return NavigationView {
                ZStack {
                    Color.accentColor.edgesIgnoringSafeArea(.all)
                    VStack {
                        InfoText(msg: "도착역을 지정해주세요!")
                        NavigationLink(destination: SearchPageNavigatorView()){
                                SearchPageButton()
                        }
                        NavigationLink(destination: SearchPageNavigatorView2()){
                                SearchPageButton()
                        }
                    }
                }
                .navigationBarTitle("지금 무슨 역이지?")
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
