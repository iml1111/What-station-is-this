//
//  SmallerButtonStyle.swift
//  What-station-is-this
//
//  Created by 신희재 on 2021/04/26.
//

import SwiftUI

struct SmallerButtonStyle : ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        
        configuration
            .label
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
    
    
}

