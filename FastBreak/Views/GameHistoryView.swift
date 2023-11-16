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
    @StateObject var vm = DataController.shared
    
    var sortedArray: [GameHistory] {
        return gameHistoryArray.sorted { $0.date! > $1.date!}
    }
    var body: some View {
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
                                
                                VStack{
                                    Text(game.playerOne ?? "Unnamed Player")
                                    Text(game.playerTwo ?? "Unnamed Player")
                                    Text(game.playerThree ?? "Unnamed Player")
                                }
                                .font(.caption)
                                
                            }
                            Spacer()
                            VStack{
                                Text("Away Team")
                                    .foregroundColor(CustomColor.goldenBrown)
                                Text("\(game.awayScore)")
                                
                                VStack{
                                    Text(game.playerFour ?? "Unnamed Player")
                                    Text(game.playerFive ?? "Unnamed Player")
                                    Text(game.playerSix ?? "Unnamed Player")
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
            Spacer()
        }
        .padding()
    }
}


#Preview {
    GameHistoryView()
}
