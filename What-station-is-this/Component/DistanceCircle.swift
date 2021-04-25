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
    
    let size: CGFloat = 180
    let lineWidth: CGFloat = 16
    
    var body: some View {
        ZStack {
            Circle()
                .trim(from: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, to: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                .stroke(Color.black.opacity(0.09),
                        style: StrokeStyle(lineWidth: self.lineWidth, lineCap: .round))
                .frame(width: self.size, height: self.size)
            
            Circle()
                .trim(from: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, to: self.remainedPercent)
                .stroke(Color.accentColor,
                        style: StrokeStyle(lineWidth: self.lineWidth, lineCap: .round))
                .frame(width: self.size, height: self.size)
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
