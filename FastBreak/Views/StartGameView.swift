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
    @StateObject var vm = DataController.shared
    @StateObject var gamevm = GameViewModel()
    
    var body: some View {
        
        ZStack{
            StartGameBackgroundView()
            StartGameBackgroundStripesView()
            VStack {
                Spacer()
                HStack(spacing: 50){
                    VStack{
                        Text("Home Team")
                            .foregroundColor(CustomColor.goldenBrown)
                        Picker("Pick", selection: $gamevm.playerOne){
                            ForEach(playerStats,id: \.self){
                                Text($0.name!).tag($0 as Player?)
                            }
                        }
              
                        Picker("Pick", selection: $gamevm.playerTwo){
                            ForEach(playerStats,id: \.self){
                                Text($0.name!).tag($0 as Player?)
                            }
                        }
               
                        Picker("Pick", selection: $gamevm.playerThree){
                            ForEach(playerStats,id: \.self){
                                Text($0.name!).tag($0 as Player?)
                            }
                        }
                       
                    }
                    VStack{
                        Text("Away Team")
                            .foregroundColor(CustomColor.goldenBrown)
                        Picker("Pick", selection: $gamevm.playerFour){
                            ForEach(playerStats,id: \.self){
                                Text($0.name!).tag($0 as Player?)
                            }
                        }
                     
                        Picker("Pick", selection: $gamevm.playerFive){
                            ForEach(playerStats,id: \.self){
                                Text($0.name!).tag($0 as Player?)
                            }
                        }
                        Picker("Pick", selection: $gamevm.playerSix){
                            ForEach(playerStats,id: \.self){
                                Text($0.name!).tag($0 as Player?)
                            }
                        }
                       
                    }
                    
                   
                }.font(.system(size: 20))
                Text("Choose 6 unique players to continue")
                    .foregroundColor(CustomColor.goldenBrown)
                    .font(.system(size: 12))
                    .padding()
               
                playGameButton
                    .disabled(gamevm.okToContinue == false)
                Spacer()
                
            }
            .navigationTitle("Player Select")
            .toolbar{
                addPlayerButton
            }
        }
        
       
        
        
      
    }
    var playGameButton: some View{
        NavigationLink(destination: ScoreboardView(gvm: gamevm)){
            HStack{
                Text("LETS PLAY")
                    .font(.title)
                Image(systemName: "play")
            }
        }
    }
    
    var ready: some View{
        Button("READY"){
            gamevm.addPlayers()
        }
    }
    
    let avm = AddPlayerViewModel()
    var addPlayerButton: some View{
       
        NavigationLink(destination: AddPlayerView(viewModel: avm)){
            
            Text("New Player")
        }
    }
    
}





struct StartGameView_Previews: PreviewProvider {
    static var previews: some View {
        StartGameView()
    }
}
