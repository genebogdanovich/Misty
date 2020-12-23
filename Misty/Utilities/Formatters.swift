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

let dayFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "cccc"
    
    return formatter
}()

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "d MMMM"
    
    return formatter
}()

let monthFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMM"
    
    return formatter
}()
