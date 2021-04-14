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
    @State var completed = false
    
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
                        action: {self.simpleNotification(text: "알람 테스트 입니당", interval: 3)},
                        label: {Text("알림 보내기")}
                    )
                }
            }
        .navigationTitle("도착역 예약 완료")
        .onAppear {
            self.currentStation = self.locationFetcher.lastKnownStation
            self.locationFetcher.setTargetStation(station: self.targetStation)
            self.simpleNotification(text: "도착역 알림 설정이 완료되었어요!", interval: 0.1)
        }
        .onDisappear() {
        }
    }
    
    func simpleNotification(text: String, interval: Double){
        let content = UNMutableNotificationContent()
        content.title = text
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(
            timeInterval: interval, repeats: false)
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
