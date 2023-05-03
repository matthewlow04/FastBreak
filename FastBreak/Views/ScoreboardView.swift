//
//  ScoreboardView.swift
//  FastBreak
//
//  Created by Matthew Low on 2023-05-03.
//

import SwiftUI

struct ScoreboardView: View {
    
    @StateObject var svm = ScoreboardViewModel()
    
    var body: some View {
        VStack{
            GameScoreView()
            ScrollView{
                Text("Home")
                PlayerLabelView(player: svm.playerOne!)
                PlayerLabelView(player: svm.playerTwo!)
                PlayerLabelView(player: svm.playerThree!)
                Spacer()
                Text("Away")
                PlayerLabelView(player: svm.playerFour!)
                PlayerLabelView(player: svm.playerFive!)
                PlayerLabelView(player: svm.playerSix!)
               
            }
        }
    }
}

struct ScoreboardView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreboardView()
    }
}
