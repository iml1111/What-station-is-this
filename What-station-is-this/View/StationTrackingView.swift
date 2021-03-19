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
        return
            VStack {
                HStack {
                    Text("가까워지면 알림을 보내드릴게요!")
                        .font(.title3)
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 5)
                Spacer()
                VStack(spacing: 30) {
                    StationBlackCard(station: targetStation)
                    Arrows()
                    StationBlackCard(station: startStation)
                }
                Spacer()
            }
        .navigationTitle("도착역 예약 완료")
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
