//
//  LocationFetcher.swift
//  What-station-is-this
//
//  Created by 신희재 on 2021/04/02.
//

import Foundation
import CoreLocation


// Location Manager 겸 Delegate
class LocationFetcher: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var authorizationStatus: CLAuthorizationStatus
    let manager = CLLocationManager()
    var lastKnownLocation: CLLocationCoordinate2D?
    @Published var lastKnownStation: StationItem = unknownStation
    var targetStation: StationItem = unknownStation
    
    override init() {
        authorizationStatus = manager.authorizationStatus
        super.init()
        manager.delegate = self
    }
    
    func start() {
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        lastKnownLocation = locations.first?.coordinate
        lastKnownStation = getCurrentStationItem(location: lastKnownLocation!)
    }
    
    func requestPermission() {
        manager.requestWhenInUseAuthorization()
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationStatus = manager.authorizationStatus
    }
    
    func setTargetStation(station: StationItem){
        targetStation = station
    }
    
    func setNearestStations(maxDistance: Int) -> Array<String>{
        // 현재 도착역에 대하여 특정 거리내의 모든 역 이름 탐색
        var result: Array<String> = []
        var queue: Array = [(name: targetStation.name, dist: 0)]
        var start = 0
        while start < queue.count {
            let name = queue[start].name
            let dist = queue[start].dist
            start += 1
            result.append(name)
            
            if dist < maxDistance {
                for connected_name in capitalStationGraph[name]! {
                    if !result.contains(connected_name) {
                        queue.append((name: connected_name, dist: dist + 1))
                    }
                }
            }
        }
        return result
    }
}
