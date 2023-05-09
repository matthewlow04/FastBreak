//
//  ScoreboardView.swift
//  FastBreak
//
//  Created by Matthew Low on 2023-05-03.
//

import SwiftUI
import ViewAnimator


struct ScoreboardView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @StateObject var gvm: GameViewModel
    
    var body: some View {
        VStack{
            GameScoreView(gvm: gvm)
            ScrollView{
                Text("Home")
                PlayerLabelView(player: gvm.playerOne!, gvm: gvm)
                PlayerLabelView(player: gvm.playerTwo!, gvm: gvm)
                PlayerLabelView(player: gvm.playerThree!, gvm: gvm)
                Spacer()
                Text("Away")
                PlayerLabelView(player: gvm.playerFour!, gvm: gvm)
                PlayerLabelView(player: gvm.playerFive!, gvm: gvm)
                PlayerLabelView(player: gvm.playerSix!, gvm: gvm)
               
            }
            
            Button("Finish Game"){
                gvm.finishGame(context: managedObjContext)
            }
            .alert("Good Game! Final Score: Home: \(gvm.homeTeam.teamPoints) - Away: \(gvm.awayTeam.teamPoints)", isPresented: $gvm.showingFinishGameAlert) {
                        Button("OK", role: .cancel) {
                            gvm.awayTeam.teamPoints = 0
                            gvm.homeTeam.teamPoints = 0
                            NavigationUtil.popToRootView()
                            
                        }
                    }
            .alert("You can't end game on a tie", isPresented: $gvm.showingAlert) {
                        Button("OK", role: .cancel) { }
                    }
        }
    }
}

//struct ScoreboardView_Previews: PreviewProvider {
//    static var previews: some View {
//        ScoreboardView()
//    }
//}
