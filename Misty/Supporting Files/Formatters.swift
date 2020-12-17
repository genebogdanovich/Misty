//
//  Formatters.swift
//  Misty
//
//  Created by Gene Bogdanovich on 17.12.20.
//

import Foundation

let timeFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "h:mm a"
    
    return formatter
}()
