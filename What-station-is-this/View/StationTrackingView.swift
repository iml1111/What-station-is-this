//
//  StationTrackingView.swift
//  What-station-is-this
//
//  Created by 신희재 on 2021/03/16.
//

import SwiftUI

struct StationTrackingView: View {
    
    @State var startStation: StationItem = testStartStation
    @State var targetStation: StationItem
    
    var body: some View {
        VStack {
            StationBlackCard(station: targetStation)
            Spacer().frame(height:50)
            Arrows()
            Spacer().frame(height:50)
            StationBlackCard(station: startStation)
//            Image(systemName: "tram.circle")
//                .foregroundColor(.accentColor)
//                .font(.system(size: 60))
//                .rotationEffect(.degrees(rotation))
        }
        .navigationTitle("도착역 예약 완료!")
    }
}


struct StationTrackingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            StationTrackingView(
                targetStation: StationItem(name: "강남역", lines: ["2호선"]))
        }
    }
}
