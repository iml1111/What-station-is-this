//
//  TitleText.swift
//  What-station-is-this
//
//  Created by 신희재 on 2021/03/14.
//

import SwiftUI

struct InfoText: View {
    
    let msg: String
    
    var body: some View {
        Text(msg)
            .font(.system(size: 20))
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .foregroundColor(.white)
            .padding()
    }
}

struct TitleText_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.accentColor.edgesIgnoringSafeArea(.all)
            InfoText(msg: "asdd")
        }
    }
}

