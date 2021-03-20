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

var kdStation = StationItem(name: "건대입구역", lines: ["02호선", "07호선"])
var longStation = StationItem(name: "건대입구역", lines: ["02호선", "07호선","02호선", "07호선","용인경전철", "인천2호선","02호선", "07호선", "02호선", "07호선","02호선", "07호선","02호선", "07호선","02호선"])
var testStation = StationItem(name: "건대입구역", lines: ["용인경전철", "용인경전철", "용인경전철", "용인경전철"])

var testStartStation = kdStation

var testStations = [
    StationItem(name: "건대입구역", lines: ["02호선", "07호선"]),
    StationItem(name: "어린이대공원역", lines: ["07호선"]),
    StationItem(name: "청담역", lines: ["07호선"]),
    StationItem(name: "서울역", lines: ["01호선", "04호선"]),
    StationItem(name: "건대입구역", lines: ["02호선", "07호선"]),
    StationItem(name: "어린이대공원역", lines: ["07호선"]),
    StationItem(name: "청담역", lines: ["07호선"]),
    StationItem(name: "서울역", lines: ["01호선", "04호선"]),
    StationItem(name: "건대입구역", lines: ["02호선", "07호선"]),
    StationItem(name: "어린이대공원역", lines: ["07호선"]),
    StationItem(name: "청담역", lines: ["07호선"]),
    StationItem(name: "서울역", lines: ["01호선", "04호선"]),
    StationItem(name: "건대입구역", lines: ["02호선", "07호선"]),
    StationItem(name: "어린이대공원역", lines: ["07호선"]),
    StationItem(name: "청담역", lines: ["07호선"]),
    StationItem(name: "서울역", lines: ["01호선", "04호선"]),
    StationItem(name: "건대입구역", lines: ["02호선", "07호선"]),
    StationItem(name: "어린이대공원역", lines: ["07호선"]),
    StationItem(name: "청담역", lines: ["07호선"]),
    StationItem(name: "서울역", lines: ["01호선", "04호선"]),
]
