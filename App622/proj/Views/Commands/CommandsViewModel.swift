//
//  CommandsViewModel.swift
//  App622
//
//  Created by IGOR on 24/06/2024.
//

import SwiftUI
import CoreData

final class CommandsViewModel: ObservableObject {
    
    @Published var photos: [String] = ["p1", "p2", "p3"]
    @Published var currentPhoto = ""

    @Published var teamPhotos: [String] = ["t1", "t2", "t3"]
    @Published var currentTPhoto = ""
    
    @Published var currentTeamName = ""
    
    @AppStorage("teamsAdded") var teamsAdded: Int = 0
    
    @Published var isAdd: Bool = false
    @Published var isAddCat: Bool = false
    @Published var isDelete: Bool = false
    @Published var isAddPlayer: Bool = false
    @Published var isDetail: Bool = false
    @Published var isAddTeam: Bool = false

    @Published var teamPhoto = ""
    @Published var teamName = ""
    @Published var teamLocation = ""

    @Published var teams: [TeamModel] = []
    @Published var selectedTeam: TeamModel?
    
    func addTeam() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "TeamModel", into: context) as! TeamModel
        
        loan.teamPhoto = teamPhoto
        loan.teamName = teamName
        loan.teamLocation = teamLocation
        
        CoreDataStack.shared.saveContext()
    }
    
    func fetchTeam() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<TeamModel>(entityName: "TeamModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.teams = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.teams = []
        }
    }
    
    @Published var partPhoto = ""
    @Published var partName = ""
    @Published var partSurname = ""
    @Published var partTeam = ""

    @Published var participants: [PartModel] = []
    @Published var selectedParticipant: PartModel?
    
    func addParticipant() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "PartModel", into: context) as! PartModel
        
        loan.partPhoto = partPhoto
        loan.partName = partName
        loan.partSurname = partSurname
        loan.partTeam = partTeam

        CoreDataStack.shared.saveContext()
    }
    
    func fetchParticipants() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<PartModel>(entityName: "PartModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.participants = result

        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.participants = []
        }
    }
}
