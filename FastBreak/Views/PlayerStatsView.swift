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
    var playerAttributeNames:[String] =  ["Points", "Assists", "Rebounds", "Steals", "Blocks"]
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
            Text(currentPlayer.name!)
                 .font(.title)
            HStack() {
                Text(currentPlayer.position!)
                
                Spacer()
                VStack{
                    Text(getTitle(player: currentPlayer))
                    Text("\(currentPlayer.games.clean) Games Played")
                } .font(.subheadline)
               
                
            }
      
         }.padding()
            .foregroundColor(CustomColor.goldenBrown)
        Form{
            Section{
                StatsListView(gamesPlayed: currentPlayer.games ,stats: playerAttributesValue(), statNames: playerAttributeNames)
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
        } .foregroundColor(CustomColor.goldenBrown)
       
       
        
       
    }
    
    func playerAttributesValue() -> [Float]{
        var mutableSelf = self
        return mutableSelf.playerAttributes
    }
    
    func getTitle(player: Player) -> String{
        if player.games >= 25{
            return "Veteran"
        }
        else if player.games >= 15{
            return "Pro"
        }
        else if player.games >= 10{
            return "Casual"
        }
        else if player.games >= 5{
            return "Amateur"
        }
        else{
            return "Newbie"
        }
    }
}


struct CircleImage: View {
    var picture: String
    var body: some View {
          Image(picture)
            .resizable()
            .frame(width: 200, height: 200)
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
            }header: {
                Text("Averages")
            }
        }
        
    }
}



//struct PlayerStatsView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlayerStatsView()
//    }
//}
