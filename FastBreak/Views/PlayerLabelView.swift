//
//  PlayerLabelView.swift
//  FastBreak
//
//  Created by Matthew Low on 2023-05-03.
//

import SwiftUI

struct PlayerLabelView: View {
    var player: Player
    
    var body: some View {
        HStack{
            Text(player.name ?? "Unnamed player")
            VStack{
                Text("Points")
                Text("0")
            }
            VStack{
                Text("Rebounds")
                Text("0")
            }
            VStack{
                Text("Assists")
                Text("0")
            }
            VStack{
                Text("Steals")
                Text("0")
            }
            VStack{
                Text("Blocks")
                Text("0")
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
