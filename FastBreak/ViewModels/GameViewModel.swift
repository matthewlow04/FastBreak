//
//  GameViewModel.swift
//  FastBreak
//
//  Created by Matthew Low on 2023-04-24.
//

import Foundation
import CoreData



class GameViewModel: ObservableObject{
    
    @Published var okToContinue = false
    @Published var playerOne: Player?{
        didSet{
            addPlayers()
            print(okToContinue)
        }
    }
    @Published var playerTwo: Player?{
        didSet{
            addPlayers()
            print(okToContinue)
        }
    }
    @Published var playerThree: Player?{
        didSet{
            addPlayers()
            print(okToContinue)
        }
    }
    @Published var playerFour: Player?{
        didSet{
            addPlayers()
            print(okToContinue)
        }
    }
    @Published var playerFive: Player?{
        didSet{
            addPlayers()
            print(okToContinue)
        }
    }
    @Published var playerSix: Player?{
        didSet{
            addPlayers()
            print(okToContinue)
        }
    }
    @Published var playersInGame = [Player]()
    @Published var homeTeam = Team(name: "Home", players: [])
    @Published var awayTeam = Team(name: "Away", players: [])
    
    func addPlayers(){
        if (playerOne != nil && playerTwo != nil && playerThree != nil && playerFour != nil && playerFive != nil && playerSix != nil){
            homeTeam.players.removeAll()
            awayTeam.players.removeAll()
            playersInGame.removeAll()
            
            homeTeam.players.append(playerOne!)
            homeTeam.players.append(playerTwo!)
            homeTeam.players.append(playerThree!)
            awayTeam.players.append(playerFour!)
            awayTeam.players.append(playerFive!)
            awayTeam.players.append(playerSix!)
            
            
            playersInGame.append(playerOne!)
            playersInGame.append(playerTwo!)
            playersInGame.append(playerThree!)
            playersInGame.append(playerFour!)
            playersInGame.append(playerFive!)
            playersInGame.append(playerSix!)
            
            toScoreboard()
            
        }

    }
    
    func noDuplicate(team: [Player]) -> Bool{
        let uniqueSet = Set(team)
        
        return uniqueSet.count == team.count
    }
    
    func toScoreboard(){
        if noDuplicate(team: playersInGame){
            okToContinue = true
        }
        else{
            okToContinue = false
        }
    }
    
}

