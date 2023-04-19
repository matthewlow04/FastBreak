//
//  Game.swift
//  FastBreak
//
//  Created by Matthew Low on 2023-04-19.
//

import Foundation

enum GameAction{
    case point
    case assist
    case rebound
    case steal
    case block
}

struct Game{
    var targetScore: Int
    var homeTeam: Team
    var awayTeam: Team
    
    init(homeTeam: Team, awayTeam: Team, targetScore: Int){
        self.homeTeam = homeTeam
        self.awayTeam = awayTeam
        self.targetScore = targetScore
    }
    
}


