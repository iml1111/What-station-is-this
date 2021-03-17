//
//  SearchPageView.swift
//  What-station-is-this
//
//  Created by 신희재 on 2021/03/14.


import SwiftUI

struct SearchPageNavigatorView: View {
    @State var stationItems: Array<StationItem> = []
    
    var body: some View {
        // navigation view 설정
        let navBarAppearance = UINavigationBar.appearance()

        // 본문 타이틀 텍스트를 컬러
        navBarAppearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.black
        ]
        // 헤더 타이틀 텍스트 컬러
        navBarAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.black
        ]
        
        // 상단 서치바 세팅
        navBarAppearance.barTintColor = .white
        navBarAppearance.isTranslucent = false
        navBarAppearance.shadowImage = UIImage()
        navBarAppearance.setBackgroundImage(UIImage(), for: .default)
        
        return CustomNavigationView(
            view: AnyView(
                SearchPageView(stationItems: $stationItems)
            ),
            placeHolder: "서울역",
            largeTitle: true,
            title: "도착역 예약하기",
            onSearch: { (txt) in
                if txt != "" {
                    self.stationItems = testStations.filter{
                        $0.name.lowercased().contains(txt.lowercased())
                    }
                }
                else {
                    self.stationItems = []
                }
                
            },
            onCancel: {
                self.stationItems = testStations
            }
        ).ignoresSafeArea()
    }
}

struct SearchPageView: View {
    // 현재 검색 결과로 도출된 역 리스트
    @Binding var stationItems: [StationItem]
    
    var body: some View {
        ScrollView(.vertical) {
                ForEach(stationItems) { Station in
                    NavigationLink(
                        destination:
                            StationTrackingView(
                                targetStation: Station
                            )
                    ){
                        SearchCardView(station: Station)
                    }
                }
        }
    }
}

struct SearchPageView_Previews: PreviewProvider {
    static var previews: some View {
        SearchPageNavigatorView()
    }
}
