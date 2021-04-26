//
//  TopToastMessage.swift
//  What-station-is-this
//
//  Created by 신희재 on 2021/04/03.
//

import SwiftUI

struct WhiteTopToastMessage: View {
    let string: String
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Image(systemName: "tram")
                    .foregroundColor(.accentColor)
                Text(string)
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)
            }
            .padding(.vertical, 17)
            .padding(.horizontal, 20)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 5)
            .padding()
            .padding(.bottom, 10)
            
        }
    }
}


struct TopToastMessage_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.accentColor.edgesIgnoringSafeArea(.all)
            WhiteTopToastMessage(string: "현재역 갱신 완료!")
        }
       
    }
}
