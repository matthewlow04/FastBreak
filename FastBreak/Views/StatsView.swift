//
//  StatsView.swift
//  FastBreak
//
//  Created by Matthew Low on 2023-04-19.
//

import SwiftUI

struct StatsView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: []) var playerStats: FetchedResults<Player>
    
    @StateObject var vm = DataController.shared
    
    
    var body: some View {

        List{
            ForEach(playerStats){ player in
                NavigationLink(destination: PlayerStatsView(currentPlayer: player)){
                    HStack{
                        VStack(alignment: .leading, spacing: 6){
                            Text(player.name!)
                                .bold()
                            Text(player.position!)
                        }
                       
                    }
                }
            }
            .onDelete(perform: deletePlayer)
        }.navigationTitle(Text("Player Stats"))
        
        
        
    }
    
    private func deletePlayer(offsets: IndexSet){
        offsets.map {playerStats[$0]}.forEach(managedObjContext.delete)
        vm.save(context: managedObjContext)
    }
    
   
   
}


struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
    }
}
