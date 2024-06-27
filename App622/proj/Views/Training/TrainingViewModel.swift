//
//  TrainingViewModel.swift
//  App622
//
//  Created by IGOR on 24/06/2024.
//

import SwiftUI
import CoreData

final class TrainingViewModel: ObservableObject {

    @Published var trainingPhotos: [String] = ["muscle", "girlmuscle"]
    @Published var currentTPhoto = ""
    
    @Published var currentTeamName = ""
    
    @AppStorage("teamsAdded") var teamsAdded: Int = 0
    
    @Published var isAdd: Bool = false
    @Published var isAddCat: Bool = false
    @Published var isDelete: Bool = false
    @Published var isAddPlayer: Bool = false
    @Published var isDetail: Bool = false
    @Published var isAddTeam: Bool = false

    @Published var exPhoto = ""
    @Published var exName = ""
    @Published var exNumEx = ""
    @Published var exEx = ""

    @Published var trainings: [ExerModel] = []
    @Published var selectedTraining: ExerModel?
    
    func addTraining() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "ExerModel", into: context) as! ExerModel
        
        loan.exPhoto = exPhoto
        loan.exName = exName
        loan.exNumEx = exNumEx
        loan.exEx = exEx
        
        CoreDataStack.shared.saveContext()
    }
    
    func fetchTrainings() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ExerModel>(entityName: "ExerModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.trainings = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.trainings = []
        }
    }
}
