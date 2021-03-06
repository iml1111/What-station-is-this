//
//  ContentView.swift
//  What-station-is-this
//
//  Created by 신희재 on 2021/03/14.
//

import SwiftUI
//import UserNotifications
import CoreLocation
import MapKit
import ExytePopupView


struct ContentView: View {
    
    // @StateObject var notificationDelegate = NotificationDelegate()
    @EnvironmentObject var locationFetcher: LocationFetcher
    @State var currentStationItem = startStation
    
    @State var showingPopup = false
    @State var showingInfoPopup = false
    
    // 앱 실행 초기 위치 추적기 실행 타이머
    var firstTimer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State var firstTimerCount = 0
    var permanentTimer = Timer.publish(every: 3.0, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        GeometryReader { gm in
            NavigationView {
                ZStack {
                    Color.accentColor.edgesIgnoringSafeArea(.all)
                    VStack {
                        Text("지금 무슨 역이지?")
                            .font(.largeTitle)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                            .padding()
                            .padding(.top, 20)
                        Spacer()
                        VStack {
                            Image("icon")
                                .foregroundColor(.white)
                                .font(.system(size: 25))
                            switch locationFetcher.authorizationStatus {
                            case .authorizedAlways, .authorizedWhenInUse, .restricted:
                                VStack {
                                    ZStack {
                                        Rectangle()
                                            .fill(Color.white)
                                            .frame(maxWidth: .infinity,
                                                   maxHeight: 23)
                                        Button(
                                            action: {
                                                self.currentStationItem = self.locationFetcher.lastKnownStation
                                                self.showingPopup = true
                                            },
                                            label: {
                                                StationCard(
                                                    station: $currentStationItem,
                                                    gmWidth: gm.size.width,
                                                    gmHeight: gm.size.height
                                                )
                                            }
                                        ).buttonStyle(SmallerButtonStyle())
                                    }
                                    
                                    NavigationLink(
                                        destination: SelectPageView()
                                    ){
                                        HStack {
                                            SearchPageButton()
                                        }
                                    }
                                }
                            case .notDetermined:
                                LocationNotDeterminedLabel()
                            case .denied:
                                LocationDeniedLabel()
                            @unknown default:
                                EtcLabel(string: "알 수 없는 에러 발생!")
                            }
                        }
                        .padding(.bottom, 74)
                        Spacer()
                        Button(
                            action: {
                                self.showingInfoPopup = true
                            },
                            label: {AuthorCard(gmWidth: gm.size.width, gmHeight: gm.size.height)
                                .padding(.bottom, 22)}
                        ).buttonStyle(SmallerButtonStyle())
                        
                    }
                }
                .navigationBarHidden(true)
                .popup(
                    isPresented: $showingPopup,
                    type: .toast,
                    position: .bottom,
                    animation: .spring(),
                    autohideIn: 0.7,
                    closeOnTap: true,
                    closeOnTapOutside: true) {
                    WhiteTopToastMessage(string: "현재 역 갱신 완료!")
                }
                .popup(
                    isPresented: $showingInfoPopup,
                    type: .toast,
                    position: .top,
                    animation: .spring(),
                    closeOnTap: true,
                    closeOnTapOutside: true) {
                    InfoPopup()
                }
            }
        }.onAppear {
            // Notification Delegate 적용
//            UNUserNotificationCenter.current()
//                .requestAuthorization(
//                    options: [.alert, .badge, .sound]) { success, error in
//                        if success {
//                        } else if let error = error {
//                            print(error.localizedDescription)
//                        }
//                    }
//            UNUserNotificationCenter.current().delegate = notificationDelegate
            // Location Delegate 적용 및 현재 위치 추적
            self.locationFetcher.start()
            
        }.onReceive(firstTimer) { _ in
            // First Timer: 맨처음 앱을 켰을때 최대한 빨리 역을 갱신시키기 위함
            if (
                self.locationFetcher.authorizationStatus != .notDetermined
                    && self.locationFetcher.authorizationStatus != .denied
            ) {
                self.currentStationItem = self.locationFetcher.lastKnownStation
                if (
                    self.currentStationItem.name != unknownStation.name
                    || self.firstTimerCount > 10
                ){
                    firstTimer.upstream.connect().cancel()
                    self.firstTimerCount = -1
                }
                self.firstTimerCount += 1
            }
        }.onReceive(permanentTimer) { _ in
            // Permenant Timer: 첫 실행 이후, 5초마다 정기적으로 현재역 갱신
            if (
                self.locationFetcher.authorizationStatus != .notDetermined
                    && self.locationFetcher.authorizationStatus != .denied
            ) {
                self.currentStationItem = self.locationFetcher.lastKnownStation
            }
        }
        
        
    }
    
//    func createNotification(location: CLLocationCoordinate2D, stationName: String){
//        let content = UNMutableNotificationContent()
//        content.title = "가장 가까운 역은: \(stationName)"
//        content.body = "lat:\(location.latitude), lng: \(location.longitude)"
//
//        let trigger = UNTimeIntervalNotificationTrigger(
//            timeInterval: 0.1, repeats: false)
//        let request = UNNotificationRequest(
//            identifier: "IN-APP",
//            content: content,
//            trigger: trigger
//        )
//        UNUserNotificationCenter.current()
//            .add(request, withCompletionHandler: nil)
//    }
//
//    func createNotification2(){
//        let content = UNMutableNotificationContent()
//        content.title = "위치 정보 조회에 실패했어요!"
//
//        let trigger = UNTimeIntervalNotificationTrigger(
//            timeInterval: 0.1, repeats: false)
//        let request = UNNotificationRequest(
//            identifier: "IN-APP",
//            content: content,
//            trigger: trigger
//        )
//        UNUserNotificationCenter.current()
//            .add(request, withCompletionHandler: nil)
//    }
}



// 알림 delegate ?? -> 이걸 안하면 알림이 안옴
//class NotificationDelegate:
//    NSObject, ObservableObject, UNUserNotificationCenterDelegate {
//
//    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
//
//        completionHandler([.badge, .banner, .sound])
//    }
//}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

