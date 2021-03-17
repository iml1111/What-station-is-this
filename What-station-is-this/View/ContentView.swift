//
//  ContentView.swift
//  What-station-is-this
//
//  Created by 신희재 on 2021/03/14.
//
// - 현재역 표시 버튼 -> 재수정 필요(리사이징, 디자인 배치 등)
// - 서치 리스트에 밑줄 그어주기
// - 다크모드 이슈 해결하기
// - 트래킹 페이지 이미지

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        // navigation view 설정
        let navBarAppearance = UINavigationBar.appearance()

        // 본문 타이틀 텍스트를 컬러
        navBarAppearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
            // 헤더 타이틀 텍스트 컬러
        ]
        navBarAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        // 두번째 화면에서 나타날 nav bar 헤더 투명화
        navBarAppearance.shadowImage = UIImage()
        navBarAppearance.setBackgroundImage(UIImage(), for: .default)
        
        return GeometryReader { gm in
            NavigationView {
                    ZStack {
                        Color.accentColor.edgesIgnoringSafeArea(.all)
                        VStack {
                            StationCard(station: testStartStation)
                            NavigationLink(
                                destination: SearchPageNavigatorView()
                                    .navigationBarTitle("", displayMode: .inline)
                            ){
                                HStack {
                                    SearchPageButton()
                                }
                                
                            }
                            Spacer().frame(height: gm.size.height / 5)
                        }
                    }
                    .navigationBarTitle("지금 무슨 역이지?")
                }
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
