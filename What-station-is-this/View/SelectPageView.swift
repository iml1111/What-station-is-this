//
//  SelectPageView.swift
//  What-station-is-this
//
//  Created by 신희재 on 2021/03/18.
//

import SwiftUI

struct SelectPageView: View {
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(sortDescriptors: [])
    private var recentSelectItems: FetchedResults<RecentSelected>
    
    @State var searchText: String = ""
    @State var showCancelButton: Bool = false
    @State var stationItems: Array<StationItem> = Array(capitalStations.values)
    
    var body: some View {
        
        // navigation view 설정
        let navBarAppearance = UINavigationBar.appearance()

        // 본문 타이틀 텍스트를 컬러
        navBarAppearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.black
        // 헤더 타이틀 텍스트 컬러
        ]
        navBarAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.black
        ]
        
        return VStack {
            SearchBar(
                searchText: $searchText,
                showCancelButton: $showCancelButton
            )
            if self.searchText.isEmpty {
                List {
                    ForEach(recentSelectItems) { item in
                        NavigationLink(
                            destination:
                                StationTrackingView(
                                    targetStation: capitalStations[item.name!]!
                                )
                        ){
                            SearchCard(station: capitalStations[item.name!]!)
                        }
                    }
                }
            }
            else {
                List {
                    ForEach(
                        self.stationItems.filter {
                            $0.name.contains(self.searchText)
                        }
                    ){ station in
                        NavigationLink(
                            destination:
                                StationTrackingView(
                                    targetStation: station
                                )
                        ){
                            SearchCard(station: station)
                        }
                    }
                }
            }
        }
        .navigationBarTitle("도착역 찾아보기")
        .resignKeyboardOnDragGesture()
    }
    
}

// 액션별로 키보드 영역을 내리기 위한 처리
extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}

struct ResignKeyboardOnDragGesture: ViewModifier {
    var gesture = DragGesture().onChanged{_ in
        UIApplication.shared.endEditing(true)
    }
    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}

extension View {
    func resignKeyboardOnDragGesture() -> some View {
        return modifier(ResignKeyboardOnDragGesture())
    }
}


struct SelectPageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SelectPageView()
        }
    }
}
