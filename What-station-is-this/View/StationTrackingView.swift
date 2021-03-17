//
//  StationTrackingView.swift
//  What-station-is-this
//
//  Created by 신희재 on 2021/03/16.
//

import SwiftUI

struct StationTrackingView: View {
    
    var startStation: StationItem = testStartStation
    var targetStation: StationItem
    
    var body: some View {
        VStack {
            StationCard(station: targetStation)
            StationCard(station: startStation)
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("끝내기")
            })
        }
    }
}

struct StationTrackingView_Previews: PreviewProvider {
    static var previews: some View {
        StationTrackingView(
            targetStation: StationItem(name: "강남역", lines: ["2호선"]))
    }
}
