//
//  TaskRepository.swift
//  Todo
//
//  Created by Ameer Hamza on 18/04/2021.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Firebase

class TaskRepository: ObservableObject {
    
    let db = Firestore.firestore()
    
    @Published var tasks = [Task]()
    
    init() {
        loadData()
    }
    
    func loadData(){
        
        let userId = Auth.auth().currentUser?.uid
        
        db.collection("tasks")
            .order(by: "createdTime")
            .whereField("userID", isEqualTo: userId)
            .addSnapshotListener { (querySnapshot, error) in
                if let querySnapshot = querySnapshot {
                    
                    self.tasks = querySnapshot.documents.compactMap{ document in
                        do{
                            let x = try document.data(as: Task.self)
                            return x
                        }
                        catch{
                            print(error)
                        }
                        return nil
                    }
                    
                }
            }
        
    }
    
    func addTask(_ task: Task){
        
        do{
            
            var addedTask = task
            addedTask.userID = Auth.auth().currentUser?.uid
            
            let _ = try db.collection("tasks").addDocument(from: addedTask)
        }
        catch{
            fatalError("Unable to encode task: \(error.localizedDescription)")
        }
        
    }
    
    func updateTask(_ task: Task){
        
        if let taskID = task.id{
            do{
                try db.collection("tasks").document(taskID).setData(from: task)
            }
            catch{
                fatalError("Unable to encode task: \(error.localizedDescription)")
            }
        }
        
    }
}
