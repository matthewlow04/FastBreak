//
//  ScoreboardView.swift
//  FastBreak
//
//  Created by Matthew Low on 2023-05-03.
//

import SwiftUI

struct ScoreboardView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @StateObject var gvm: GameViewModel
    
    var body: some View {
        VStack{
            GameScoreView(gvm: gvm)
            ScrollView{
                Text("Home")
                    .foregroundColor(CustomColor.goldenBrown)
                    .font(Font.system(size: 20, weight: .semibold, design: .rounded))
                PlayerLabelView(player: gvm.playerOne!, gvm: gvm)
                    .foregroundColor(CustomColor.chestNut)
                PlayerLabelView(player: gvm.playerTwo!, gvm: gvm)
                    .foregroundColor(CustomColor.chestNut)
                PlayerLabelView(player: gvm.playerThree!, gvm: gvm)
                    .foregroundColor(CustomColor.chestNut)
                Spacer()
                Text("Away")
                    .foregroundColor(CustomColor.goldenBrown)
                    .font(Font.system(size: 20, weight: .semibold, design: .rounded))
                PlayerLabelView(player: gvm.playerFour!, gvm: gvm)
                    .foregroundColor(CustomColor.chestNut)
                PlayerLabelView(player: gvm.playerFive!, gvm: gvm)
                    .foregroundColor(CustomColor.chestNut)
                PlayerLabelView(player: gvm.playerSix!, gvm: gvm)
                    .foregroundColor(CustomColor.chestNut)
               
            }
            
            Button("Finish Game"){
                gvm.finishGame(context: managedObjContext)
            }.font(.title)
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
