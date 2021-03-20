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
    
    @StateObject var delegate = NotificationDelegate()
    
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
                        StationCard(station: testStartStation)
                        NavigationLink(
                            destination: SelectPageView()
                        ){
                            HStack {
                                SearchPageButton()
                            }
                        }
                        Spacer()
                    }
                }
                .navigationBarHidden(true)
            }
        }.onAppear {
            UNUserNotificationCenter.current()
                .requestAuthorization(
                    options: [.alert, .badge, .sound]) { success, error in
    //                    if success {
    //                    } else if let error = error {
    //                        print(error.localizedDescription)
    //                    }
                    }
            UNUserNotificationCenter.current().delegate = delegate
            print("notice perm OK.")
        }
    }
}

// 알림 delegate ?? -> 이걸 안하면 알림이 안옴
class NotificationDelegate:
    NSObject, ObservableObject, UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        completionHandler([.badge, .banner, .sound])
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
