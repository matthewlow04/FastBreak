//
//  PlayerLabelView.swift
//  FastBreak
//
//  Created by Matthew Low on 2023-05-03.
//

import SwiftUI

struct PlayerLabelView: View {
    @ObservedObject var player: Player
    @StateObject var gvm: GameViewModel
    
    var body: some View {
        HStack{
            Text(player.name ?? "Unnamed player")
                .lineLimit(2)
                .frame(width: 100, height: 50, alignment: .center)
            VStack{
                
                Text("Pts")
                Text("\(player.points)")
                    
            }
            .onTapGesture(perform: {gvm.scoreboardMove(sender: "point", player: player)})
            .frame(width: 50, height: 50)
            VStack{
                Text("Ast")
                Text("\(player.assists)")
                    
            }
            .onTapGesture(perform: {gvm.scoreboardMove(sender: "assist", player: player)})
            .frame(width: 50, height: 50)
            VStack{
                Text("Reb")
                Text("\(player.rebounds)")
                    
            }
            .onTapGesture(perform: {gvm.scoreboardMove(sender: "rebound", player: player)})
            .frame(width: 50, height: 50)
            VStack{
                Text("Stl")
                Text("\(player.steals)")
                    
            }
            .onTapGesture(perform: {gvm.scoreboardMove(sender: "steal", player: player)})
            .frame(width: 50, height: 50)
            VStack{
                Text("Blk")
                Text("\(player.blocks)")
            }
            .onTapGesture(perform: {gvm.scoreboardMove(sender: "block", player: player)})
            .frame(width: 50, height: 50)
        }
    }
    
}

/*
struct PlayerLabelView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerLabelView()
    }
}
*/
