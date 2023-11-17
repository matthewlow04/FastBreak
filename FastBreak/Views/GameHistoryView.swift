//
//  GameHistoryView.swift
//  FastBreak
//
//  Created by Matthew Low on 2023-11-16.
//

import SwiftUI

struct GameHistoryView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: []) var gameHistoryArray: FetchedResults<GameHistory>
    @FetchRequest(sortDescriptors: []) var playerStats: FetchedResults<Player>
    
    @StateObject var vm = DataController.shared
   
    var sortedArray: [GameHistory] {
        return gameHistoryArray.sorted { $0.date! > $1.date!}
    }
    var body: some View {
        NavigationStack{
        VStack{
            Text("Game History")
                .padding()
                .font(Font.system(size: 40, weight: .bold))
                .foregroundColor(CustomColor.smokyBlack)
            
            ScrollView{
                
                    ForEach(sortedArray, id: \.self){ game in
                        VStack{
                           
                            HStack{
                                VStack{
                                    Text("Home Team")
                                        .foregroundColor(CustomColor.goldenBrown)
                                    Text("\(game.homeScore)")
                                    
                                    VStack(spacing: 5){
  
                                        PlayerView(playerName: game.playerOne ?? "", playerStats: Array(playerStats), vm: vm)
                                        PlayerView(playerName: game.playerTwo ?? "", playerStats: Array(playerStats), vm: vm)
                                        PlayerView(playerName: game.playerThree ?? "", playerStats: Array(playerStats), vm: vm)

                                    }
                                    .font(.caption)
                                    
                                }
                                Spacer()
                                VStack{
                                    Text("Away Team")
                                        .foregroundColor(CustomColor.goldenBrown)
                                    Text("\(game.awayScore)")
                                    
                                    VStack(spacing: 5){
                                        PlayerView(playerName: game.playerFour ?? "", playerStats: Array(playerStats), vm: vm)
                                        PlayerView(playerName: game.playerFive ?? "", playerStats: Array(playerStats), vm: vm)
                                        PlayerView(playerName: game.playerSix ?? "", playerStats: Array(playerStats), vm: vm)
                                    }
                                    .font(.caption)
                                }
                            }
                            Text(formattedDate(date: game.date!))
                                .foregroundColor(CustomColor.chestNut)
                                .font(.caption)
                        }
                        .padding()
                        .cornerRadius(10) // Adjust as needed
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(CustomColor.dun, lineWidth: 1)
                        )
                        .padding(.bottom, 10)
                    }
                }
                
            }
            Spacer()
        }
        .padding()
        
    }
}

struct PlayerView: View {
    let playerName: String
    let playerStats: [Player]
    let vm: DataController

    var body: some View {
        
        let player = vm.findPlayer(name: playerName, players: Array(playerStats))

        return Group {
            if let player = player {
                NavigationLink(destination: PlayerStatsView(currentPlayer: player, svm: StatsViewModel())) {
                    Text(playerName)
                }
            } else {
                Text("Unnamed Player")
            }
        }
    }
}


#Preview {
    GameHistoryView()
}
