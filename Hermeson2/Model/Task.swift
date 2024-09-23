//
//  Task.swift
//  Hermeson2
//
//  Created by user on 29/08/24.
//

import Foundation


import SwiftUI

struct Task: Identifiable, Codable, Hashable {
    var id = UUID()
    var title: String
    var description: String
    var date = Date()
    var pronta: Bool = false
    
    static var mock: Task {
        Task(title: "Sample Task", description: "This is a sample description.", date: Date(), pronta: false)
    }
}
