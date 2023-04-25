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
        
        VStack{
            Spacer()
            HStack{
                Text("Name: ")
                TextField("Name", text: $viewModel.name)
            }
            HStack{
                Text("Position: ")
                Picker("Select a position", selection: $viewModel.selection){
                    ForEach(viewModel.positions, id: \.self){
                        Text($0)
                    }
                    .pickerStyle(.wheel)
                    
                }
            }
            Spacer()
            Button("Add Player") {
                DataController().addPlayer(name: viewModel.name, position: viewModel.selection, context: managedObjContext)
                dismiss()
            }
            
           
        }
      
    }
}


struct AddPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AddPlayerViewModel()
        AddPlayerView(viewModel: viewModel)
    }
}
