//
//  ContentView.swift
//  FastBreak
//
//  Created by Matthew Low on 2023-04-19.
//

import SwiftUI

struct HomeView: View {
    
    @State var scale = 1.0
    var body: some View {
        NavigationView{
            VStack{
                Text("F A S T B R E A K")
                    .font(.title)
                    .padding()
                playButton
                    .padding()
                addButton
                    .padding()
                statsButton
                    .padding()
     
            }
            .foregroundColor(CustomColor.smokyBlack)
            .scaleEffect(scale)
            .onAppear {
                withAnimation {scale = 0.9}
            }

        }
    }
    var playButton: some View {
        
        NavigationLink(destination: StartGameView()) {
            HStack{
                Text("PLAY")
                Image(systemName: "play")
            }
        }
    }
    let addPlayer = AddPlayerViewModel()
    var addButton: some View{
       
        NavigationLink(destination: AddPlayerView(viewModel: addPlayer)){
            HStack{
                Text("ADD PLAYERS")
                Image(systemName: "play")
            }
        }
    }


    var statsButton: some View{
        NavigationLink(destination: StatsView()){
            HStack{
                Text("STATS")
                Image(systemName: "play")
            }
        }
    }

}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
