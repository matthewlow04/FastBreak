//
//  GameViewModel.swift
//  FastBreak
//
//  Created by Matthew Low on 2023-04-24.
//

import Foundation
import CoreData
import SwiftUI


class GameViewModel: ObservableObject{

    @Published var okToContinue = false
    @Published var playerOne: Player?{
        didSet{
            addPlayers()
        }
    }
    @Published var playerTwo: Player?{
        didSet{
            addPlayers()
        }
    }
    @Published var playerThree: Player?{
        didSet{
            addPlayers()
        }
    }
    @Published var playerFour: Player?{
        didSet{
            addPlayers()
        }
    }
    @Published var playerFive: Player?{
        didSet{
            addPlayers()
        }
    }
    @Published var playerSix: Player?{
        didSet{
            addPlayers()
        }
    }
    @Published var playersInGame = [Player]()
    @Published var homeTeam = Team(name: "Home", players: [])
    @Published var awayTeam = Team(name: "Away", players: [])
    @Published var showingAlert = false
    
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
    
    func scoreboardMove(sender: String, player: Player){
        switch sender{
        case "point":
            player.points += 1
            if homeTeam.containsPlayer(checkPlayer: player){
                homeTeam.teamPoints += 1
            }
            else{
                awayTeam.teamPoints += 1
            }
        
        case "assist":
            player.assists += 1
            
        case "rebound":
            player.rebounds += 1
            
        case "steal":
            player.steals += 1
            
        case "block":
            player.blocks += 1
            
        default:
            print("Invalid move")

        }

    }
    
    func clearStats(){
        for player in playersInGame{
            player.rebounds = 0
            player.assists = 0
            player.points = 0
            player.blocks = 0
            player.steals = 0
        }
    }
    
    func startGame(){
        var game = Game(homeTeam: homeTeam, awayTeam: awayTeam, targetScore: 11)
        clearStats()
    }
    
    func finishGame(context: NSManagedObjectContext){
        
        if homeTeam.teamPoints == awayTeam.teamPoints{
            showingAlert = true
            return
        }
        
        if homeTeam.teamPoints > awayTeam.teamPoints{
            for player in homeTeam.players{
                player.wins += 1
            }
            for player in awayTeam.players{
                player.losses += 1
            }
        }
        else{
            for player in homeTeam.players{
                player.losses += 1
            }
            for player in awayTeam.players{
                player.wins += 1
            }
        }
        
        for player in playersInGame {
            player.totalPoints += player.points
            player.totalAssists += player.assists
            player.totalRebounds += player.rebounds
            player.totalSteals += player.steals
            player.totalBlocks += player.blocks
            player.games += 1
        }
        
       
        clearStats()
        
        DataController.shared.save(context: context)

    }
    
}

