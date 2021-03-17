//
//  TitleText.swift
//  What-station-is-this
//
//  Created by 신희재 on 2021/03/14.
//

import SwiftUI

struct StationCard: View {
    
    var station: StationItem
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                ForEach(0..<self.station.lines.count) { idx in
                    if idx < 2 {
                        Image(self.station.lines[idx])
                    }

                }
            }
            Text(station.name)
                .font(.system(size: 25))
                .fontWeight(.bold)
                .foregroundColor(.accentColor)
        }
        .frame(minWidth:210)
        .padding(.horizontal, 20.0)
        .padding(.vertical, 12.0)
        .background(Color.white)
        .cornerRadius(40)
        .shadow(color: Color.gray, radius: 2, x: 0, y: 0)
        
    }
}


struct StationCard_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.accentColor.edgesIgnoringSafeArea(.all)
            VStack {
                StationCard(station: testStation)
                StationCard(station: kdStation)
            }
           
        }
    }
}

