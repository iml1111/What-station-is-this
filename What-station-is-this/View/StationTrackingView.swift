//
//  StationTrackingView.swift
//  What-station-is-this
//
//  Created by 신희재 on 2021/03/16.
//

import SwiftUI
import ExytePopupView

struct StationTrackingView: View {
    
    @EnvironmentObject var locationFetcher: LocationFetcher
    
    @State var currentStation: StationItem = startStation
    @State var targetStation: StationItem
    
    @State var remainedInfo: String = "계산 중..."
    @State var remainedPercent: CGFloat = 0
    @State var totalDistance: Int = 0
    @State var currentDistance: Int = 0
    
    @State var showingPopup = false
    var timer = Timer.publish(every: 5.0, on: .main, in: .common).autoconnect()
    
    var body: some View {
        GeometryReader { gm in
            VStack {
                HStack {
                    Text("\(targetStation.name)역에 향하는 중이에요!")
                        .font(.system(size: 17))
                    Spacer()
                }
                .padding(.horizontal)
                Spacer()
                DistanceCircle(
                    remainedInfo: $remainedInfo,
                    remainedPercent: $remainedPercent,
                    gmWidth: gm.size.width,
                    gmHeight: gm.size.height)
                    .padding(.bottom, 30)
                ZStack {
                    Rectangle()
                        .fill(Color.accentColor)
                        .frame(maxWidth: .infinity, maxHeight: 22)
                    Button(
                        action: {
                            refreshCurrentStatus()
                            self.showingPopup = true
                        },
                        label: {
                            StationBlueCard(
                                station: $currentStation,
                                gmWidth: gm.size.width,
                                gmHeight: gm.size.height)
                        }
                    ).buttonStyle(SmallerButtonStyle())
                }
                Spacer()
                Spacer()
            }
            .navigationTitle("지금 어디쯤이지?")
            .onAppear {
                self.currentStation = self.locationFetcher.lastKnownStation
                self.locationFetcher.setTargetStation(station: self.targetStation)
                self.totalDistance = self.locationFetcher.getDistanceByTargetStation(station: self.currentStation)
                self.currentDistance = self.totalDistance
                self.remainedInfo = "\(self.totalDistance)"
            }
            .onReceive(timer) { _ in
                refreshCurrentStatus()
            }
            .popup(
                isPresented: $showingPopup,
                type: .toast,
                position: .bottom,
                animation: .spring(),
                autohideIn: 1,
                closeOnTap: true,
                closeOnTapOutside: true) {
                WhiteTopToastMessage(string: "현재 역 갱신 완료!")
            }
        }
    }
    
    func refreshCurrentStatus() {
        self.currentStation = self.locationFetcher.lastKnownStation
        self.currentDistance = self.locationFetcher.getDistanceByTargetStation(station: self.currentStation)
        if self.currentDistance > self.totalDistance {
            self.totalDistance = self.currentDistance
        }
        self.remainedInfo = "\(self.currentDistance)"
        let total: CGFloat = CGFloat(self.totalDistance)
        let cur: CGFloat = CGFloat(self.currentDistance)
        self.remainedPercent = (total - cur) / total
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
