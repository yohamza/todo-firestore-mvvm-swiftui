//
//  TaskCellViewModel.swift
//  Todo
//
//  Created by Ameer Hamza on 10/04/2021.
//

import Foundation
import Combine
import Firebase

class TaskCellViewModel: ObservableObject, Identifiable{
    
    @Published var taskRepository = TaskRepository()
    @Published var task: Task
        
    var id = ""
    @Published var completedStateIconName = ""
    private var cancellable = Set<AnyCancellable>()
    
    init(task: Task) {
        self.task = task
        
        $task.map{ task in
            task.completed ? "checkmark.circle.fill" : "circle"
        }
        .assign(to: \.completedStateIconName, on: self)
        .store(in: &cancellable)
        
        $task.compactMap{task in
            task.id
        }
        .assign(to: \.id, on: self)
        .store(in: &cancellable)
        
        $task
            .dropFirst()
            .debounce(for: 0.8, scheduler: RunLoop.main)
            .sink{ task in
                self.taskRepository.updateTask(task)
        }
            .store(in: &cancellable)
    }
    
}
