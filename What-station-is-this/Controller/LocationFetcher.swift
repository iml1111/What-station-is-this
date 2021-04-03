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
}
