//
//  AddPlayerView.swift
//  FastBreak
//
//  Created by Matthew Low on 2023-04-19.
//

import SwiftUI

struct AddPlayerView: View {
   
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) var managedObjContext
    @State private var showingAlert = false
    
    @ObservedObject var viewModel: AddPlayerViewModel
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    HStack{
                        Text("Name: ")
                        TextField("Name", text: $viewModel.name)
                            .foregroundColor(CustomColor.dun).opacity(1)
                    }
                }
                Section{
                    Picker("Select a position", selection: $viewModel.selection){
                        ForEach(viewModel.positions, id: \.self){
                            Text($0)
                        }
                        .pickerStyle(.segmented)
                    }
                }header: {
                    Text("Position")
                }
                Section{
                    Button("Add Player") {
                        DataController.shared.addPlayer(name: viewModel.name, position: viewModel.selection, context: managedObjContext)
                        
                        showingAlert = true
                        viewModel.name = ""
                        dismiss()
                        
                    }
                    .alert("Player saved", isPresented: $showingAlert){
                        Button("OK", role: .cancel) {}
                    }
                }
                
            }
            .navigationTitle("Add Player").foregroundColor(CustomColor.goldenBrown)
        }.accentColor(CustomColor.chestNut)
    }
}


struct AddPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AddPlayerViewModel()
        AddPlayerView(viewModel: viewModel)
    }
}
