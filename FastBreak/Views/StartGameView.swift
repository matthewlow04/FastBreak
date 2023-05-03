//
//  StartGameView.swift
//  FastBreak
//
//  Created by Matthew Low on 2023-04-19.
//

import SwiftUI



struct StartGameView: View {
    @FetchRequest(sortDescriptors: []) var playerStats: FetchedResults<Player>
    @Environment(\.managedObjectContext) var managedObjContext
    @StateObject var vm = DataController()
    @ObservedObject var game = GameViewModel()
    
    var body: some View {
        
        VStack {
            addPlayerButton
            
            HStack(spacing: 50){
                VStack{
                    Text("Home Team")
                    Picker("Pick", selection: $game.playerOne){
                        ForEach(playerStats,id: \.self){
                            Text($0.name!).tag($0 as Player?)
                        }
                    }
          
                    Picker("Pick", selection: $game.playerTwo){
                        ForEach(playerStats,id: \.self){
                            Text($0.name!).tag($0 as Player?)
                        }
                    }
           
                    Picker("Pick", selection: $game.playerThree){
                        ForEach(playerStats,id: \.self){
                            Text($0.name!).tag($0 as Player?)
                        }
                    }
                   
                }
                VStack{
                    Text("Away Team")
                    Picker("Pick", selection: $game.playerFour){
                        ForEach(playerStats,id: \.self){
                            Text($0.name!).tag($0 as Player?)
                        }
                    }
                 
                    Picker("Pick", selection: $game.playerFive){
                        ForEach(playerStats,id: \.self){
                            Text($0.name!).tag($0 as Player?)
                        }
                    }
                    Picker("Pick", selection: $game.playerSix){
                        ForEach(playerStats,id: \.self){
                            Text($0.name!).tag($0 as Player?)
                        }
                    }
                   
                }
            }
            
            playGameButton
                .disabled(game.okToContinue == false)
            
        }
        
      
    }
    var playGameButton: some View{
        NavigationLink(destination: ScoreboardView()){
            HStack{
                Text("LETS PLAY")
                Image(systemName: "play")
            }
        }
    }
    
    var ready: some View{
        Button("READY"){
            game.addPlayers()
            
        }
       
    }
    let avm = AddPlayerViewModel()
    var addPlayerButton: some View{
       
        NavigationLink(destination: AddPlayerView(viewModel: avm)){
            HStack{
                Text("ADD PLAYERS")
                Image(systemName: "play")
            }
        }
    }
    
    
}



struct StartGameView_Previews: PreviewProvider {
    static var previews: some View {
        StartGameView()
    }
}
