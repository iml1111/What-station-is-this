//
//  Arrows.swift
//  What-station-is-this
//
//  Created by 신희재 on 2021/03/18.
//

import SwiftUI

struct ArrowShape : Shape {

    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.size.width, y: rect.size.height/2.0))
        path.addLine(to: CGPoint(x: 0, y: rect.size.height))

        return path
    }
}

struct Arrows: View {
    private let arrowCount = 3

    let timer = Timer.publish(
        every: 1.3, on: .main, in: .common).autoconnect()
    
    @State var scale:CGFloat = 1.0
    @State var fade:Double = 0.5

    var body: some View {
        return HStack{
            ForEach(0..<self.arrowCount) { i in
                ArrowShape()
                    .stroke(style: StrokeStyle(lineWidth: CGFloat(10),
                                              lineCap: .round,
                                              lineJoin: .round ))
                    .foregroundColor(Color.accentColor)
                    .aspectRatio(
                        CGSize(width: 50, height: 70), contentMode: .fit)
                    .frame(maxWidth: 20)
                    .opacity(self.fade)
                    .scaleEffect(self.scale)
                    .animation(
                        Animation.linear(duration: 0.8)
                        .repeatCount(1, autoreverses: true)
                        .delay(0.2 * Double(i))
                    )
                    .onAppear(perform: {
                        self.scale = 1.2
                        self.fade = 1.0
                    })
            }.onReceive(self.timer) { _ in
                self.scale = self.scale == 1 ?  1.2 : 1.0
                self.fade = self.fade == 0.5 ? 1.0 : 0.5
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            self.scale = 1
                            self.fade = 0.5
                }
            }
        }
        .padding()
        .rotationEffect(.degrees(270))
    }
}


struct Arrows_Previews: PreviewProvider {
    static var previews: some View {
        Arrows()
    }
}
