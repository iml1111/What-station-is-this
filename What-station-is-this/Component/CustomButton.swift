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
            Text("도착역 예약하기")
                .font(.system(size: 20))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
            Image(systemName: "chevron.right")
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
