//
//  StationTrackingView.swift
//  What-station-is-this
//
//  Created by 신희재 on 2021/03/16.
//

import SwiftUI

struct StationTrackingView: View {
    
    var stationItem: StationItem
    
    var body: some View {
        Text("This is " + stationItem.name)
    }
}

struct StationTrackingView_Previews: PreviewProvider {
    static var previews: some View {
        StationTrackingView(
            stationItem: StationItem(name: "건대입구역", lines: ["2호선", "7호선"]))
    }
}
