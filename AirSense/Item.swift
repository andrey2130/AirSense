//
//  Item.swift
//  AirSense
//
//  Created by Andrii Duda on 19.10.2026.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
