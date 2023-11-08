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
    @Published var showingFinishGameAlert = false
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
    
    func scoreboardMove(sender: String, player: Player, increase: Bool){
        switch sender{
        case "point":
            if(increase){
                player.points += 1
                if homeTeam.containsPlayer(checkPlayer: player){
                    homeTeam.teamPoints += 1
                }
                else{
                    awayTeam.teamPoints += 1
                }
            }
            else{
                if(player.points <= 0){
                    return
                }
                player.points -= 1
                if homeTeam.containsPlayer(checkPlayer: player){
                    homeTeam.teamPoints -= 1
                }
                else{
                    awayTeam.teamPoints -= 1
                }
            }
            
          
        
        case "assist":
            if(increase){
                player.assists += 1
                if homeTeam.containsPlayer(checkPlayer: player){
                    homeTeam.teamAssists += 1
                }
                else{
                    awayTeam.teamAssists += 1
                }
            }
            else{
                if(player.assists <= 0){
                    return
                }
                player.assists -= 1
                if homeTeam.containsPlayer(checkPlayer: player){
                    homeTeam.teamAssists -= 1
                }
                else{
                    awayTeam.teamAssists -= 1
                }
            }
            
           
            
            
        case "rebound":
            if(increase){
                player.rebounds += 1
                if homeTeam.containsPlayer(checkPlayer: player){
                    homeTeam.teamRebounds += 1
                }
                else{
                    awayTeam.teamRebounds += 1
                }
            }
            else{
                if(player.rebounds <= 0){
                    return
                }
                player.rebounds -= 1
                if homeTeam.containsPlayer(checkPlayer: player){
                    homeTeam.teamRebounds -= 1
                }
                else{
                    awayTeam.teamRebounds -= 1
                }
            }
            
        case "steal":
            if(increase){
                player.steals += 1
                if homeTeam.containsPlayer(checkPlayer: player){
                    homeTeam.teamSteals += 1
                }
                else{
                    awayTeam.teamSteals += 1
                }
            }
            else{
                if(player.steals <= 0){
                    return
                }
                player.steals -= 1
                if homeTeam.containsPlayer(checkPlayer: player){
                    homeTeam.teamSteals -= 1
                }
                else{
                    awayTeam.teamSteals -= 1
                }
            }
        case "block":
            if(increase){
                player.blocks += 1
                if homeTeam.containsPlayer(checkPlayer: player){
                    homeTeam.teamBlocks += 1
                }
                else{
                    awayTeam.teamBlocks += 1
                }
            }
            else{
                if(player.blocks <= 0){
                    return
                }
                player.blocks -= 1
                if homeTeam.containsPlayer(checkPlayer: player){
                    homeTeam.teamBlocks -= 1
                }
                else{
                    awayTeam.teamBlocks -= 1
                }
            }
            
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
        
        for player in homeTeam.players{
            player.teamPoints += Float(homeTeam.teamPoints)
            player.teamAssists += Float(homeTeam.teamAssists)
            player.teamRebounds += Float(homeTeam.teamRebounds)
            player.teamSteals += Float(homeTeam.teamSteals)
            player.teamBlocks += Float(homeTeam.teamBlocks)
        }
        
        for player in awayTeam.players{
            player.teamPoints += Float(awayTeam.teamPoints)
            player.teamAssists += Float(awayTeam.teamAssists)
            player.teamRebounds += Float(awayTeam.teamRebounds)
            player.teamSteals += Float(awayTeam.teamSteals)
            player.teamBlocks += Float(awayTeam.teamBlocks)
        }
        
        showingFinishGameAlert = true
        
        clearStats()
        
        DataController.shared.save(context: context)

    }
    
}

