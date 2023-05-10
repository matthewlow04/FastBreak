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
    @State private var showingAlert = false
    
    
    var body: some View {
     
            VStack{
                List{
                    ForEach(playerStats){ player in
                        NavigationLink(destination: PlayerStatsView(currentPlayer: player)){
                            HStack{
                                VStack(alignment: .leading, spacing: 6){
                                    Text((player.name ?? "UnnamedPlayer"))
                                        .bold()
                                    Text(player.position!)
                                }
                               
                            }
                        }
                    }
                    .onDelete(perform: deletePlayer)
                }.navigationTitle(Text("Player Stats")).foregroundColor(CustomColor.goldenBrown)
                Text("Swipe left on player cells to delete player")
                    .foregroundColor(CustomColor.goldenBrown)
                    .font(.system(size: 12))
                    
            }  .alert("Player deleted", isPresented: $showingAlert){
                Button("OK", role: .cancel) {}
      
        }

       
        
        
    }
    
    private func deletePlayer(offsets: IndexSet){
        offsets.map {playerStats[$0]}.forEach(managedObjContext.delete)
        showingAlert = true
        vm.save(context: managedObjContext)
    }
    
   
   
}


struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
    }
}
