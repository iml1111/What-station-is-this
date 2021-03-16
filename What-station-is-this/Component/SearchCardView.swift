//
//  SearchCardView.swift
//  What-station-is-this
//
//  Created by 신희재 on 2021/03/15.
//

import SwiftUI

struct SearchCardView: View {
    
    let station: StationItem
    
    var body: some View {
        VStack {
            HStack {
                Text(station.name)
                    .font(.title2)
                    .foregroundColor(Color.black)
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


struct SearchCardView_Previews: PreviewProvider {
    static var previews: some View {
        SearchCardView(station: StationItem(name: "건대입구역", lines: ["2호선", "7호선"]))
    }
}
