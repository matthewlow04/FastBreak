//
//  Team.swift
//  FastBreak
//
//  Created by Matthew Low on 2023-04-19.
//

import Foundation

struct Team: Hashable{
    var name: String
    var players: [Player]
    var teamPoints = 0
    
    init(name: String, players: [Player]){
        self.players = []
        self.name = name
    }
    
    mutating func addPlayer(_ player: Player){
        self.players.append(player)
    }
    
    func containsPlayer(checkPlayer: Player) -> Bool {
        var contains = false
        
        for player in players{
            if checkPlayer.id == player.id{
                contains = true
                break
            }
        }
        
        return contains
    }
    
}
