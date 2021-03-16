//
//  RoundButton.swift
//  What-station-is-this
//
//  Created by 신희재 on 2021/03/14.
//

import SwiftUI

struct SearchPageButton: View {
    
    var body: some View {
        Text("검색하기")
            .font(.system(size: 25))
            .fontWeight(.bold)
            .padding(.horizontal, 70.0)
            .padding(.vertical, 15.0)
            .background(Color.white)
            .foregroundColor(.accentColor)
            .cornerRadius(30)
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
