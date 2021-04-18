//
//  Task.swift
//  Todo
//
//  Created by Ameer Hamza on 09/04/2021.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Task: Codable, Identifiable {
    @DocumentID var id: String?
    var title: String
    var completed: Bool
    @ServerTimestamp var createdTime: Timestamp?
    var userID: String?
}

#if DEBUG

let testDataTasks = [
    Task(title: "Implement the UI", completed: true),
    Task(title: "Firebase Implementation", completed: false),
    Task(title: "????", completed: false),
    Task(title: "Profit!!", completed: false)
]

#endif
