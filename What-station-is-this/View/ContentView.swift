//
//  ContentView.swift
//  What-station-is-this
//
//  Created by 신희재 on 2021/03/14.
//
// - 현재역 표시 버튼 -> 재수정 필요(노선 리사이징, 디자인 배치 등)
// - 설정 창 ?

import SwiftUI
import UserNotifications


struct ContentView: View {
    
    let userNoficationCenter = UNUserNotificationCenter.current()
    
    var body: some View {
        
        return GeometryReader { gm in
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
                        StationCard(station: testStartStation)
                        NavigationLink(
                            destination: SelectPageView()
                        ){
                            HStack {
                                SearchPageButton()
                            }
                        }
                        Spacer()
                        VStack {
                            Button(
                                action: {
                                    self.requestNotificationPermission()
                                },
                                label: {
                                Text("알림 퍼미션 요청")
                                    .foregroundColor(.white)
                            })
                                .padding()
                            Button(
                                action: {
                                    self.sendNotification()
                                },
                                label: {
                                Text("알림 보내기")
                                    .foregroundColor(.white)
                            })
                        }
                    }
                }
                .navigationBarHidden(true)
            }
        }.onAppear {
            print("뷰가 생성됨")
        }
    }
    
    func requestNotificationPermission() {
        userNoficationCenter
            .requestAuthorization(
                options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("알림 퍼미션 확인 완료")
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
    }
    
    func sendNotification() {
        print("알림 전송됨 start")
        let content = UNMutableNotificationContent()
        content.title = "Feed the cat"
        content.subtitle = "It looks hungry"
        content.body = "이것은 알림을 테스트 하는 것이다"
        content.sound = UNNotificationSound.default

        // show this notification five seconds from now
        let trigger = UNTimeIntervalNotificationTrigger(
            timeInterval: 5, repeats: false)

        // choose a random identifier
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content, trigger: trigger)

        // add our notification request
        userNoficationCenter.add(request) { error in
                if let error = error {
                    print("Notification Error: ", error)
                }
            }
        print("알림 전송됨 end")
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
