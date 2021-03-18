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
                    ForEach(station.lines, id: \.self) { line in
                        Image(line)
                            .resizable()
                            .frame(width: 20.0, height: 20.0)
                    }
                }.padding(.trailing)
            }
            .padding(.vertical, 10)
        }
        
    }
}


struct SearchCard_Previews: PreviewProvider {
    static var previews: some View {
        SearchCard(station: StationItem(name: "건대입구역", lines: ["2호선", "7호선"]))
    }
}
