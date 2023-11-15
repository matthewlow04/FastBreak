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
    @State var searchText = ""
    @State var selectedSortOption = "Points"
    var sortOptions = ["Points", "Rebounds", "Assists", "Steals", "Blocks"]
    
    var filteredPlayers: [Player] {
        if searchText.isEmpty {
            return Array(playerStats)
        } else {
            return Array(playerStats)
                .filter { $0.name!.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var sortedPlayers: [Player] {
            switch selectedSortOption {
            case "Points":
                return filteredPlayers.sorted(by: { $0.totalPoints/$0.games > $1.totalPoints/$1.games })
            case "Rebounds":
                return filteredPlayers.sorted(by: { $0.totalRebounds/$0.games > $1.totalRebounds/$1.games })
            case "Assists":
                return filteredPlayers.sorted(by: { $0.totalAssists/$0.games > $1.totalAssists/$1.games })
            case "Steals":
                return filteredPlayers.sorted(by: { $0.totalSteals/$0.games > $1.totalSteals/$1.games })
            case "Blocks":
                return filteredPlayers.sorted(by: { $0.totalBlocks/$0.games > $1.totalBlocks/$1.games })
            default:
                return filteredPlayers
            }
        }
    
    var body: some View {
     
            VStack{
                List{
                    ForEach(sortedPlayers){ player in
                        NavigationLink(destination: PlayerStatsView(currentPlayer: player, svm: StatsViewModel())){
                            HStack{
                                VStack(alignment: .leading, spacing: 6){
                                    Text((player.name ?? "UnnamedPlayer"))
                                        .bold()
                                    Text(player.position!)
                                }
                                Spacer()
                                switch selectedSortOption {
                                    case "Points":
                                    Text("\((player.totalPoints/player.games).clean) PPG")
                                    case "Rebounds":
                                        Text("\((player.totalRebounds/player.games).clean) RPG")
                                    case "Assists":
                                        Text("\((player.totalAssists/player.games).clean) APG")
                                    case "Steals":
                                        Text("\((player.totalSteals/player.games).clean) SPG")
                                    case "Blocks":
                                        Text("\((player.totalBlocks/player.games).clean) BPG")
                                    default:
                                        EmptyView()
                                }
                            }
                        }
                    }
                    .onDelete(perform: deletePlayer)
                }
            }  
            .alert("Player deleted", isPresented: $showingAlert){
                Button("OK", role: .cancel) {}
                
      
            }
            .navigationTitle(Text("Player Stats")).foregroundColor(CustomColor.goldenBrown)
            .searchable(text: $searchText)
            .toolbar{
                ToolbarItem {
                    Menu{
                        Picker("Sort by", selection: $selectedSortOption) {
                            ForEach(sortOptions, id: \.self) { option in
                                Text(option).tag(option)
                            }
                        }
                    }label: {
                        Label("Sort", systemImage: "arrow.up.arrow.down.circle")
                    }
                   
//                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                }
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
