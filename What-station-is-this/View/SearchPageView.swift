//
//  SearchPageView.swift
//  What-station-is-this
//
//  Created by 신희재 on 2021/03/14.
//// https://kavsoft.dev/SwiftUI_2.0/Navigation_SearchBar/

import SwiftUI

struct SearchPageNavigatorView: View {
    @State var stationItems: Array<StationItem> = testStations
    
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
        return CustomNavigationView(
            view: AnyView(
                SearchPageView(stationItems: $stationItems)
            ),
            placeHolder: "서울역",
            largeTitle: true,
            title: "도착역 지정하기",
            onSearch: { (txt) in
            },
            onCancel: {
            }
        ).padding(.top, 0)
    }
}

struct SearchPageNavigatorView2: View {
    @State var stationItems: Array<StationItem> = testStations
    
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
        return SearchPageView(stationItems: $stationItems)
        
    }
}

struct SearchPageView: View {
    // 현재 검색 결과로 도출된 역 리스트
    @Binding var stationItems: [StationItem]
    
    var body: some View {
        ScrollView(.vertical) {
            ForEach(stationItems) { Station in
                SearchCardView(station: Station)
            }
        }
    }
}

struct SearchPageView_Previews: PreviewProvider {
    static var previews: some View {
        SearchPageNavigatorView()
        SearchPageNavigatorView2()
    }
}
