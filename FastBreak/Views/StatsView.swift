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
            .onDelete(perform: vm.deletePlayer(indexSet: IndexSet(vm.savedPlayers), context: managedObjContext))
        }
        
    }
    
   
   
}


struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
    }
}
