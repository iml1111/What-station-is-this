//
//  SearchCardView.swift
//  What-station-is-this
//
//  Created by 신희재 on 2021/03/15.
//

import SwiftUI

struct SearchCard: View {
    
    let station: StationItem
    
    var body: some View {
        VStack {
            HStack {
                Text(station.name)
                    .font(.title2)
                    .bold()
                    .padding(.leading)
                Spacer()
                HStack() {
                    ForEach(0..<self.station.lines.count) { idx in
                        if idx < 3 {
                            Image(self.station.lines[idx])
                        }

                    }
                }.padding(.trailing)
            }
            .padding(.vertical, 10)
        }
        
    }
}


struct SearchCard_Previews: PreviewProvider {
    static var previews: some View {
        SearchCard(station: StationItem(name: "남영", lines: ["인천선", "신분당선"], lat: 37.541021, lng: 126.9713))
    }
}
