//
//  ContentView.swift
//  FastBreak
//
//  Created by Matthew Low on 2023-04-19.
//

import SwiftUI
struct HomeView: View {
    
    
    var body: some View {
        
        NavigationView{
            ZStack{
                BackgroundDesignView()
                VStack{
                    Text("F A S T B R E A K")
                        .font(.title)
                        .padding()
                    playButton
                        .buttonStyle(HomeButtonStyle())
                    addButton
                        .buttonStyle(HomeButtonStyle())
                    gameLogButton
                        .buttonStyle(HomeButtonStyle())
                    statsButton
                        .buttonStyle(HomeButtonStyle())
                    
                }
                .foregroundColor(CustomColor.smokyBlack)
            }
           
        }.accentColor(CustomColor.chestNut)
        
    }
    var playButton: some View {
        
        NavigationLink(destination: StartGameView()) {
            HStack{
                Text("PLAY")
                Image(systemName: "play")
            }
            .foregroundColor(CustomColor.goldenBrown)
        }
    }
    let addPlayer = AddPlayerViewModel()
    var addButton: some View{
       
        NavigationLink(destination: AddPlayerView(viewModel: addPlayer)){
            HStack{
                Text("ADD PLAYERS")
                Image(systemName: "play")
            }
            .foregroundColor(CustomColor.goldenBrown)
        }
    }


    var statsButton: some View{
        NavigationLink(destination: StatsView()){
            HStack{
                Text("STATS")
                Image(systemName: "play")
            }
            .foregroundColor(CustomColor.goldenBrown)
        }
    }
    
    var gameLogButton: some View{
        NavigationLink(destination: GameHistoryView()){
            HStack{
                Text("GAME LOGS")
                Image(systemName: "play")
            }
            .foregroundColor(CustomColor.goldenBrown)
        }
    }

}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
