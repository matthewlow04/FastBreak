//
//  PlayerStatsView.swift
//  FastBreak
//
//  Created by Matthew Low on 2023-05-05.
//

import SwiftUI


struct PlayerStatsView: View {
    
    
    var currentPlayer: Player
    var picture = "avatar"
    @StateObject var svm:StatsViewModel
    var playerAttributeNames:[String] =  ["Points", "Assists", "Rebounds", "Steals", "Blocks", "TeamPoints"]
    lazy var playerAttributes = [currentPlayer.totalPoints, currentPlayer.totalAssists, currentPlayer.totalRebounds, currentPlayer.totalSteals, currentPlayer.totalBlocks]
    
   
    
    var body: some View {
        VStack{
            ZStack(alignment: .bottomTrailing){
                CircleImage(picture: picture)
                Image(systemName: "plus")
                    .foregroundColor(.white)
                    .frame(width: 50, height: 50)
                    .background(Color.blue)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    .offset(x: -10, y: 10)
                
            
            }
           
        }
        VStack(alignment: .leading){
            Text((currentPlayer.name ?? "UnnamedPlayer"))
                 .font(.title)
            HStack() {
                Text(currentPlayer.position!)
                
                Spacer()
                VStack{
                    Text(svm.getExperienceTitle(player: currentPlayer))
                    Text("\(currentPlayer.games.clean) Games Played")
                } .font(.subheadline)
               
                
            }
      
         }.padding()
            .foregroundColor(CustomColor.goldenBrown)
        Form{
            Section{
                StatsListView(gamesPlayed: currentPlayer.games ,stats: playerAttributesValue(), statNames: playerAttributeNames)
            }header: {
                Text("Averages").bold()
            }
            
            Section{

                HStack(spacing: 50){
                    Text("\(currentPlayer.wins.clean) wins")
                        .foregroundColor(Color.green)
                    Spacer()
                    Text("\(currentPlayer.losses.clean) losses")
                        .foregroundColor(Color.red)
                }

            }
            
            Section{
                if(!svm.titles.isEmpty){
                    ForEach(Array(zip(svm.titles, svm.titleMessages)), id: \.0) { item in
                        VStack(alignment: .leading) {
                            Text(item.0)
                                .font(.system(size: 18))
                                .bold()
                            Text(item.1)
                        }
                    }
                }else{
                    Text("No Achievements")
                        .italic()
                        .font(.subheadline)
                }
               
            }header: {
                Text("ACHIEVEMENTS")
            }
                
            Section{
                Text((currentPlayer.notes!))
            }header: {
                Text("NOTES")
            }
        } 
        .foregroundColor(CustomColor.goldenBrown)
        .onAppear{
            svm.getTitles(player: currentPlayer)
        }
       
       
        
       
    }
    
    func playerAttributesValue() -> [Float]{
        var mutableSelf = self
        return mutableSelf.playerAttributes
    }
    
}


struct CircleImage: View {
    var picture: String
    var body: some View {
          Image(picture)
            .resizable()
            .frame(width: 150, height: 150)
                .aspectRatio(contentMode: .fit)
                     .clipShape(Circle())
                     .overlay(Circle().stroke(Color.white, lineWidth: 2))
                     .shadow(radius: 10)
    }
}

struct StatsListView:View{
    var gamesPlayed: Float
    var stats: [Float]
    var statNames: [String]
    var body: some View{
        List{
            Section{
                ForEach(Array(zip(statNames,stats)), id: \.0){ stat in
                    HStack{
                        Text(stat.0)
                        Spacer()
                        Text(String(format: "%.2f", stat.1/gamesPlayed))
                    }
                    
                }
            }
        }
        
    }
}



//struct PlayerStatsView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlayerStatsView()
//    }
//}
