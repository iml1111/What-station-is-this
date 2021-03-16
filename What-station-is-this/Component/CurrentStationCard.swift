//
//  TitleText.swift
//  What-station-is-this
//
//  Created by 신희재 on 2021/03/14.
//

import SwiftUI

struct CurrentStationCard: View {
    
    var station: StationItem
    
    var body: some View {
        VStack {
            HStack {
                ForEach(station.lines, id: \.self) { line in
                    Image(line)
                        .resizable()
                        .frame(width: 35.0, height: 35.0)
                }
            }
            Text(station.name)
                .font(.system(size: 25))
                .fontWeight(.bold)
                .foregroundColor(.accentColor)
        }
        .padding(20.0)
        .background(Color.white)
        .cornerRadius(40)
    }
}

struct TitleText_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.accentColor.edgesIgnoringSafeArea(.all)
            VStack {
                CurrentStationCard(station: longStation)
                CurrentStationCard(station: kdStation)
            }
           
        }
    }
}

