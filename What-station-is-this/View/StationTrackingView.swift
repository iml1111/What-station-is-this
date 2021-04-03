//
//  StationTrackingView.swift
//  What-station-is-this
//
//  Created by 신희재 on 2021/03/16.
//

import SwiftUI

struct StationTrackingView: View {
    
    @EnvironmentObject var locationFetcher: LocationFetcher
    @State var currentStation: StationItem = startStation
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
                    StationBlackBindingCard(station: $currentStation)
                }
                Spacer()
                // 디버깅용 버튼
                VStack {
                    Button(
                        action: {self.createNotification()},
                        label: {Text("알림 보내기")}
                    )
                }
            }
        .navigationTitle("도착역 예약 완료")
            .onAppear {
                self.currentStation = self.locationFetcher.lastKnownStation
                self.locationFetcher.setTargetStation(station: self.targetStation)
            }
    }
    
    func createNotification(){
        let content = UNMutableNotificationContent()
        content.title = "도착역에 가까워졌어요!"
        
        let trigger = UNTimeIntervalNotificationTrigger(
            timeInterval: 0.1, repeats: false)
        let request = UNNotificationRequest(
            identifier: "IN-APP",
            content: content,
            trigger: trigger
        )
        UNUserNotificationCenter.current()
            .add(request, withCompletionHandler: nil)
    }
}


struct StationTrackingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            StationTrackingView(
                targetStation: StationItem(name: "남영", lines: ["01호선"], lat: 37.541021, lng: 126.9713))
        }
    }
}
