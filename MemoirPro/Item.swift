//
//  Item.swift
//  MemoirPro
//
//  Created by 方子谦 on 7/11/26.
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
