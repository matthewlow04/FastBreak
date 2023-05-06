//
//  ScoreboardView.swift
//  FastBreak
//
//  Created by Matthew Low on 2023-05-03.
//

import SwiftUI

struct ScoreboardView: View {
    
    @StateObject var gvm: GameViewModel
    @Environment(\.managedObjectContext) var managedObjContext
    @StateObject var vm = DataController.shared
    
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
            
        }
        
        Button("Finish Game"){
            gvm.finishGame(context: managedObjContext)
        }
    }
}

//struct ScoreboardView_Previews: PreviewProvider {
//    static var previews: some View {
//        ScoreboardView()
//    }
//}
