//
//  DistanceCircle.swift
//  What-station-is-this
//
//  Created by 신희재 on 2021/04/25.
//

import SwiftUI

struct DistanceCircle: View {
    
    @Binding var remainedInfo: String
    @Binding var remainedPercent: CGFloat
    let gmWidth: CGFloat
    let gmHeight: CGFloat

    
    var body: some View {
        ZStack {
            Circle()
                .trim(from: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, to: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                .stroke(Color(UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1.0)),
                        style: StrokeStyle(lineWidth: 16, lineCap: .round))
                .frame(width: gmWidth * 0.6, height: gmWidth * 0.6)
                .shadow(
                    color: Color(UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)),
                    radius: 2, x: 0, y: 1
                )
            
            Circle()
                .trim(from: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, to: self.remainedPercent)
                .stroke(Color.accentColor,
                        style: StrokeStyle(lineWidth: 16, lineCap: .round))
                .frame(width: gmWidth * 0.6, height: gmWidth * 0.6)
                .rotationEffect(.init(degrees: -90))
                .animation(.default)
            
            VStack {
                Text(remainedInfo)
                    .font(.system(size: 47))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.accentColor)
                Text("남은 정거장")
                    .font(.system(size: 15))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
            
        }
    }
}

struct DistanceCircle_Previews: PreviewProvider {
    static var previews: some View {
        Text("asd")
    }
}
