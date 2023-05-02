//
//  DataController.swift
//  FastBreak
//
//  Created by Matthew Low on 2023-03-29.
//

import Foundation
import CoreData

class DataController: ObservableObject{
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
    
    func addPlayer(name: String, position: String, context: NSManagedObjectContext) {
        let player = Player(context: context)
        player.name = name
        player.position = position
        player.id = UUID() //new food so new id
        save(context: context)
    }
    
    func editPlayer(player: Player, name: String, context: NSManagedObjectContext){
        player.name = name
        save(context: context)
        
    }
    
}
