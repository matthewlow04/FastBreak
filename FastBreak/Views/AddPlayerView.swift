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
    
    
    @ObservedObject var viewModel: AddPlayerViewModel
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    HStack{
                        Text("Name: ")
                        TextField("Name", text: $viewModel.name)
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
                        DataController().addPlayer(name: viewModel.name, position: viewModel.selection, context: managedObjContext)
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add Player")
        }
    }
}


struct AddPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AddPlayerViewModel()
        AddPlayerView(viewModel: viewModel)
    }
}
