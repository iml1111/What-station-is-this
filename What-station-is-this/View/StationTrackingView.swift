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
    @State var showingPopup = false
    
    var body: some View {
        return VStack {
            HStack {
                Text("\(targetStation.name)역으로 가는 중...")
                    .font(.system(size: 17))
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 5)
            Spacer()
            VStack(spacing: 30) {
                Button(
                    action: {
                        self.currentStation = self.locationFetcher.lastKnownStation
                        self.showingPopup = true
                    },
                    label: {
                        StationBlackBindingCard(station: $currentStation)
                    }
                )
            }
            Spacer()
        }
        .navigationTitle("지금 어디쯤이지?")
        .onAppear {
            self.currentStation = self.locationFetcher.lastKnownStation
            self.locationFetcher.setTargetStation(station: self.targetStation)
        }
        .popup(
            isPresented: $showingPopup,
            type: .toast,
            position: .top,
            animation: .spring(),
            autohideIn: 1.7,
            closeOnTap: true,
            closeOnTapOutside: true) {
            WhiteTopToastMessage(string: "현재 역 갱신 완료!")
        }
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
