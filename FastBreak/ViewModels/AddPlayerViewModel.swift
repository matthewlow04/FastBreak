//
//  AddPlayerViewModel.swift
//  FastBreak
//
//  Created by Matthew Low on 2023-04-24.
//

import Foundation



class AddPlayerViewModel: ObservableObject{
    
    @Published var selection = "Point Guard"
    @Published var name = ""
    @Published var notes = ""
    let positions = ["Point Guard", "Shooting Guard", "Small Forward", "Power Forward", "Center"]
    
}
