//
//  TitleText.swift
//  What-station-is-this
//
//  Created by 신희재 on 2021/03/14.
//

import SwiftUI

struct StationCard: View {
    
    @Binding var station: StationItem
    var gmWidth: CGFloat
    var gmHeight: CGFloat
    
    var body: some View {
                VStack {
                    HStack(alignment: .center) {
                        ForEach(0..<self.station.lines.count, id: \.self) { idx in
                            Image(self.station.lines[idx])
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: gmHeight * 0.03)
                        }
                    }
                    Text(station.name)
                        .font(.system(size: gmWidth * 0.06))
                        .fontWeight(.bold)
                        .foregroundColor(.accentColor)
                }
                .frame(maxWidth: gmWidth * 0.65, maxHeight: gmHeight * 0.1)
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


struct StationBlueCard: View {
    
    @Binding var station: StationItem
    var gmWidth: CGFloat
    var gmHeight: CGFloat
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                ForEach(0..<self.station.lines.count, id: \.self) { idx in
                    Image(self.station.lines[idx])
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: gmHeight * 0.03)
                }
            }
            Text(station.name)
                .font(.system(size: gmWidth * 0.06))
                .fontWeight(.bold)
                .foregroundColor(.black)
        }
        .frame(maxWidth: gmWidth * 0.65, maxHeight: gmHeight * 0.1)
        .padding(.horizontal, 10.0)
        .padding(.vertical, 6.0)
        .background(Color.white)
        .cornerRadius(40)
        .padding(.horizontal, 6.0)
        .padding(.vertical, 6.0)
        .background(Color.accentColor)
        .cornerRadius(40)
        .shadow(
            color: Color(UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)),
            radius: 2, x: 0, y: 1
        )
        
    }
}


struct StationCard_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.accentColor.edgesIgnoringSafeArea(.all)
            VStack {
//                StationCard(station: $testStation)
//                StationCard(station: $kdStation)
            }
           
        }
    }
}

