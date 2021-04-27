//
//  InfoPopup.swift
//  What-station-is-this
//
//  Created by 신희재 on 2021/04/27.
//
// 유의사항: gps 부정확 안내, 수도권 지하철역만 지원, 알림 추후 추가 예정, 실제 최단 거리는 아님

import SwiftUI

struct InfoPopup: View {
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Text("HI, I'M IML!")
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .padding(.bottom, 10)

                Text("'지금 무슨역'인지, 도착역과의 거리는 \n 어느정도인지 알려주는 어플입니다! \n 아래와 같은 사항을 유의해주세요!")
                    .foregroundColor(.black)
                    .font(.system(size: 14))
                    .foregroundColor(Color(red: 0.9, green: 0.9, blue: 0.9))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 10)
                    .lineSpacing(5)
                
                Text("✔️GPS 기반이라 항상 정확하진 않아요. \n ✔️현재는 수도권만 지원합니다. \n ✔️실제 최단 거리가 아닌 대략적인 거리에요! \n ✔️반응이 좋다면 알림 기능도 생각중입니다! \n ✔️피드백은 달게 받겠습니다😿")
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .font(.system(size: 14))
                    .foregroundColor(Color(red: 0.9, green: 0.9, blue: 0.9))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 10)
                    .lineSpacing(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                
                
            
                Text("Good Bye!")
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .padding(.bottom, 10)
            }
            .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
            .padding(.horizontal, 10)
            .background(Color(.white))
            .cornerRadius(40)
            .shadow(radius: 10)
            Spacer()
        }
    }
}

struct InfoPopup_Previews: PreviewProvider {
    static var previews: some View {
        InfoPopup()
    }
}
