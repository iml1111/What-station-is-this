//
//  Locator.swift
//  What-station-is-this
//
//  Created by 신희재 on 2021/04/02.
//

import SwiftUI
import CoreLocation

func pow(_ a: Double) -> Double {
    return a * a
}

func getDistance(location: CLLocationCoordinate2D, station: StationItem) -> Double {
    return pow(location.latitude - station.lat) + pow(location.longitude - station.lng)
}

func getCurrentStationItem(location: CLLocationCoordinate2D) -> StationItem {
    var currentStationItem: StationItem = allStations[0]
    var minDistance: Double = getDistance(location: location, station: currentStationItem)
    
    for i in 1..<allStations.count {
        let curDistance = getDistance(location: location, station: allStations[i])
        if curDistance < minDistance {
            currentStationItem = allStations[i]
            minDistance = curDistance
        }
    }
    
    return currentStationItem
}
