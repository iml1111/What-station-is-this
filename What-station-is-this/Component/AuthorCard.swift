//
//  AuthorCard.swift
//  What-station-is-this
//
//  Created by 신희재 on 2021/04/27.
//

import SwiftUI

struct AuthorCard: View {
    
    var gmWidth: CGFloat
    var gmHeight: CGFloat
    
    var body: some View {
                VStack {
                    Text("By. IML")
                        .font(.system(size: gmWidth * 0.04))
                        .fontWeight(.bold)
                        .foregroundColor(.accentColor)
                }
                .frame(maxWidth: gmWidth * 0.15, maxHeight: gmHeight * 0.025)
                .padding(.horizontal, 20.0)
                .padding(.vertical, 12.0)
                .background(Color.white)
                .cornerRadius(40)
                .shadow(
                    color: Color(UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)),
                    radius: 2, x: 0, y: 1
                )
    }
}

struct AuthorCard_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gm in
            ZStack {
                Color.accentColor.edgesIgnoringSafeArea(.all)
                AuthorCard(gmWidth: gm.size.width, gmHeight: gm.size.height)
            }
        }
    }
}
