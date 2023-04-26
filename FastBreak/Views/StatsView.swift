//
//  StatsView.swift
//  FastBreak
//
//  Created by Matthew Low on 2023-04-19.
//

import SwiftUI

struct StatsView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    
    @StateObject var vm = DataController()
   
    
    var body: some View {
        List{
            ForEach(vm.savedPlayers){ player in
                NavigationLink(destination: Text("Edit Player View")){
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
        offsets.map {vm.savedPlayers[$0]}.forEach(managedObjContext.delete)
        vm.save(context: managedObjContext)
    }
    
   
   
}


struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
    }
}
