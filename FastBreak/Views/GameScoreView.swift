//
//  GameScoreView.swift
//  FastBreak
//
//  Created by Matthew Low on 2023-05-03.
//

import SwiftUI

struct GameScoreView: View {
    var body: some View {
        HStack{
            VStack{
                Text("Home")
                Text("0")
            }
            Text("-")
            VStack{
                Text("Away")
                Text("0")
            }
        }
        .font(.largeTitle)
    }
}

struct GameScoreView_Previews: PreviewProvider {
    static var previews: some View {
        GameScoreView()
    }
}
