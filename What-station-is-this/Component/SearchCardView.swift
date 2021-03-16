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
        HStack {
            Text(station.name)
                .font(.title2)
                .bold()
                .padding(.leading)
            ForEach(station.lines, id: \.self) { line in
                Image(line)
            }
            Spacer()
        }
        .padding(.vertical, 10)
    }
}


struct SearchCardView_Previews: PreviewProvider {
    static var previews: some View {
        SearchPageNavigatorView()
    }
}
