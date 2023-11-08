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
                .frame(width: 100, height: 50, alignment: .leading)
                .padding(.leading, 10)
                .font(Font.system(size: 20, weight: .semibold, design: .rounded))
            VStack{
                IncreaseButton(sender: "point", player: player, gvm: gvm)
                Text("Pts")
                    .font(Font.system(size: 20, weight: .medium, design: .rounded))
                Text("\(player.points.clean)")
                    .font(Font.system(size: 20, weight: .medium, design: .rounded))
                DecreaseButton(sender: "point", player: player, gvm: gvm)
                    
            }
            .frame(width: 50, height: 50)
            VStack{
                IncreaseButton(sender: "assist", player: player, gvm: gvm)
                Text("Ast")
                    .font(Font.system(size: 20, weight: .medium, design: .rounded))
                Text("\(player.assists.clean)")
                    .font(Font.system(size: 20, weight: .medium, design: .rounded))
                DecreaseButton(sender: "assist", player: player, gvm: gvm)
            }
           
            .frame(width: 50, height: 50)
            VStack{
                IncreaseButton(sender: "rebound", player: player, gvm: gvm)
                Text("Reb")
                    .font(Font.system(size: 20, weight: .medium, design: .rounded))
                Text("\(player.rebounds.clean)")
                    .font(Font.system(size: 20, weight: .medium, design: .rounded))
                DecreaseButton(sender: "rebound", player: player, gvm: gvm)
            }
            .frame(width: 50, height: 50)
            VStack{
                IncreaseButton(sender: "steal", player: player, gvm: gvm)
                Text("Stl")
                    .font(Font.system(size: 20, weight: .medium, design: .rounded))
                Text("\(player.steals.clean)")
                    .font(Font.system(size: 20, weight: .medium, design: .rounded))
                DecreaseButton(sender: "steal", player: player, gvm: gvm)
                    
            }
            .frame(width: 50, height: 50)
            VStack{
                IncreaseButton(sender: "block", player: player, gvm: gvm)
                Text("Blk")
                    .font(Font.system(size: 20, weight: .medium, design: .rounded))
                Text("\(player.blocks.clean)")
                    .font(Font.system(size: 20, weight: .medium, design: .rounded))
                DecreaseButton(sender: "block", player: player, gvm: gvm)
            }
            .frame(width: 50, height: 50)
            
        }
        .animation(.easeInOut, value: UUID())
        .padding(.vertical, 12)
    }
    
    struct IncreaseButton: View {
        var sender: String
        var player: Player
        var gvm: GameViewModel

        var body: some View {
            Button(action: {
                gvm.scoreboardMove(sender: sender, player: player, increase: true)
                print("Increase")
            }) {
                Image(systemName: "chevron.up")
            }
        }
    }
    
    struct DecreaseButton: View {
        var sender: String
        var player: Player
        var gvm: GameViewModel

        var body: some View {
            Button(action: {
                gvm.scoreboardMove(sender: sender, player: player, increase: false)
                print("Decrease")
            }) {
                Image(systemName: "chevron.down")
            }
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
