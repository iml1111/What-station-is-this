//
//  StationItem.swift
//  What-station-is-this
//
//  Created by 신희재 on 2021/03/15.
//

import SwiftUI


struct StationItem: Identifiable {
    var id = UUID().uuidString
    // 역이름
    var name: String
    // 소속된 호선
    var lines: Array<String>
}

var kdStation = StationItem(name: "건대입구역", lines: ["2호선", "7호선"])
var longStation = StationItem(name: "건대입구역", lines: ["2호선", "7호선","2호선", "7호선","용인경전철", "인천2호선","2호선", "7호선", "2호선", "7호선","2호선", "7호선","2호선", "7호선","2호선"])
var testStation = StationItem(name: "건대입구역", lines: ["용인경전철", "용인경전철", "용인경전철", "용인경전철"])

var testStartStation = kdStation

var testStations = [
    StationItem(name: "건대입구역", lines: ["2호선", "7호선"]),
    StationItem(name: "어린이대공원역", lines: ["7호선"]),
    StationItem(name: "청담역", lines: ["7호선"]),
    StationItem(name: "서울역", lines: ["1호선", "4호선"]),
    StationItem(name: "건대입구역", lines: ["2호선", "7호선"]),
    StationItem(name: "어린이대공원역", lines: ["7호선"]),
    StationItem(name: "청담역", lines: ["7호선"]),
    StationItem(name: "서울역", lines: ["1호선", "4호선"]),
    StationItem(name: "건대입구역", lines: ["2호선", "7호선"]),
    StationItem(name: "어린이대공원역", lines: ["7호선"]),
    StationItem(name: "청담역", lines: ["7호선"]),
    StationItem(name: "서울역", lines: ["1호선", "4호선"]),
    StationItem(name: "건대입구역", lines: ["2호선", "7호선"]),
    StationItem(name: "어린이대공원역", lines: ["7호선"]),
    StationItem(name: "청담역", lines: ["7호선"]),
    StationItem(name: "서울역", lines: ["1호선", "4호선"]),
    StationItem(name: "건대입구역", lines: ["2호선", "7호선"]),
    StationItem(name: "어린이대공원역", lines: ["7호선"]),
    StationItem(name: "청담역", lines: ["7호선"]),
    StationItem(name: "서울역", lines: ["1호선", "4호선"]),
]
