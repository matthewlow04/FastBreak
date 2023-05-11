//
//  NumberFormatter.swift
//  FastBreak
//
//  Created by Matthew Low on 2023-05-05.
//

import Foundation

extension Float{
    var clean: String{
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}


