//
//  AddPlayerViewModel.swift
//  FastBreak
//
//  Created by Matthew Low on 2023-04-24.
//

import Foundation
import SwiftUI



class AddPlayerViewModel: ObservableObject{
    
    @Environment(\.managedObjectContext) var managedObjContext
    @Published var selection = "Point Guard"
    @Published var name = ""
    let positions = ["Point Guard", "Shooting Guard", "Small Forward", "Power Forward", "Center"]
    
    
}
