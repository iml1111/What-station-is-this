//
//  RoundButton.swift
//  What-station-is-this
//
//  Created by 신희재 on 2021/03/14.
//

import SwiftUI

struct SearchPageButton: View {
    
    var body: some View {
        HStack {
            Text("도착역 찾아보기")
                .font(.system(size: 20))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
            Image(systemName: "chevron.right")
                .foregroundColor(.white)
        }.padding()
    }
}


struct LocationNotDeterminedLabel: View {
    
    var body: some View {
        HStack {
            Image(systemName: "location")
                .foregroundColor(.white)
            Text("위치 정보 권한 확인...")
                .font(.system(size: 20))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
            
        }.padding()
    }
}

struct LocationDeniedLabel: View {
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "location")
                    .foregroundColor(.white)
                Text("삐빅, 위치 추적 불가!")
                    .font(.system(size: 20))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                
            }.padding()
            Text("앱 설정에 들어가서")
                .font(.system(size: 17))
                .foregroundColor(.white)
            Text("위치 정보 권한을 허용해주세요 :(")
                .font(.system(size: 17))
                .foregroundColor(.white)
        }
        .padding()
    }
}


struct EtcLabel: View {
    
    let string: String
    
    var body: some View {
        HStack {
            Text(string)
                .font(.system(size: 20))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
            
        }.padding()
    }
}

struct RoundButton_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ZStack {
            Color.accentColor.edgesIgnoringSafeArea(.all)
            SearchPageButton()
        }
    }
}
