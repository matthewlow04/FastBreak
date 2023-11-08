//
//  GameScoreView.swift
//  FastBreak
//
//  Created by Matthew Low on 2023-05-03.
//

import SwiftUI

struct GameScoreView: View {
    @StateObject var gvm: GameViewModel
    var body: some View {
        HStack{
            VStack{
                Text("Home")
                Text("\(gvm.homeTeam.teamPoints)")
            }
            Text("-")
            VStack{
                Text("Away")
                Text("\(gvm.awayTeam.teamPoints)")
            }
        }
        .font(Font.system(size: 40, weight: .semibold, design: .rounded))
    }
}

//struct GameScoreView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameScoreView()
//    }
//}
