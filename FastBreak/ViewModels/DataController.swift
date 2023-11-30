//
//  DataController.swift
//  FastBreak
//
//  Created by Matthew Low on 2023-03-29.
//

import Foundation
import CoreData

class DataController: ObservableObject{
    
    static let shared = DataController()
    let container = NSPersistentContainer(name: "PlayerModel")
    
    init(){
        container.loadPersistentStores{ desc, error in
            if let error = error{
                print("Failed to load the data \(error.localizedDescription)")
            }
            
        }
    }
    
    //save function
    func save(context: NSManagedObjectContext){
        do {
            try context.save()
            print("Data saved!")
        } catch {
            print ("Data not saved")
        }
    }
    
    func addPlayer(name: String, position: String, notes: String, context: NSManagedObjectContext) {
        let player = Player(context: context)
        player.name = name
        player.position = position
        player.notes = notes
        player.id = UUID()
        save(context: context)
    }
    
    func editPlayer(player: Player, name: String, context: NSManagedObjectContext){
        player.name = name
        save(context: context)
    }
    
    func findPlayer(name: String, players: [Player]) -> Player?{
        let playerList = players
        if(playerList.filter{$0.name == name}.isEmpty){
            return nil
        }else{
            return playerList.filter{$0.name == name}[0]
        }
     
    }
    
 
    func addGameHistory(aScore: Int, hScore: Int, aTeam: [Player], hTeam: [Player], context: NSManagedObjectContext){
        let gameHistory = GameHistory(context: context)
        gameHistory.date = Date.now
        gameHistory.id = UUID()
        gameHistory.awayScore = Int16(aScore)
        gameHistory.homeScore = Int16(hScore)
        
        gameHistory.playerOne = hTeam[0].name
        gameHistory.playerTwo = hTeam[1].name
        gameHistory.playerThree = hTeam[2].name
        
        gameHistory.playerFour = aTeam[0].name
        gameHistory.playerFive = aTeam[1].name
        gameHistory.playerSix = aTeam[2].name
        
       
        
        
//        let setOfAwayPlayers = NSSet(array: aTeam)
//        gameHistory.awayPlayers = setOfAwayPlayers
//        
//        let setOfHomePlayers = NSSet(array: hTeam)
//        gameHistory.homePlayers = setOfHomePlayers
    }
    
}
