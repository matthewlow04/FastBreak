//
//  DateFormatter.swift
//  FastBreak
//
//  Created by Matthew Low on 2023-11-16.
//

import Foundation

func formattedDate(date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMM d, yyyy"
    return dateFormatter.string(from: date)
}
