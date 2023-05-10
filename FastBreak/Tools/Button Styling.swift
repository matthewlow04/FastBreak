//
//  Button Styling.swift
//  FastBreak
//
//  Created by Matthew Low on 2023-05-09.
//

import SwiftUI

struct HomeButtonStyle: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View{
        configuration.label
            .padding()
            .foregroundColor(.black)
            .background(configuration.isPressed ? CustomColor.dun.opacity(0.4) : CustomColor.dun)
            .clipShape(Capsule())
    }
}
