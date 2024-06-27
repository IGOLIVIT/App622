//
//  MatchesViewModel.swift
//  App622
//
//  Created by IGOR on 24/06/2024.
//

import SwiftUI
import CoreData

final class MatchesViewModel: ObservableObject {
    
    @Published var photos: [String] = ["p1", "p2", "p3"]
    @Published var currentPhoto = ""

    @Published var teamPhotos: [String] = ["t1", "t2", "t3"]
    @Published var currentTPhoto1 = ""
    @Published var currentTPhoto2 = ""
    
    @Published var currentTeamName = ""
    
    @AppStorage("teamsAdded") var teamsAdded: Int = 0
    
    @Published var isAdd: Bool = false
    @Published var isAddCat: Bool = false
    @Published var isDelete: Bool = false
    @Published var isAddPlayer: Bool = false
    @Published var isDetail: Bool = false
    @Published var isAddTeam: Bool = false

    @Published var matTeamPhoto1 = ""
    @Published var matTeamPhoto2 = ""
    @Published var matTeamName1 = ""
    @Published var matTeamName2 = ""
    @Published var matResT1 = ""
    @Published var matResT2 = ""
    @Published var matLoc = ""
    @Published var matStad = ""
    @Published var matDate = ""

    @Published var matches: [MatchesModel] = []
    @Published var selectedMatch: MatchesModel?
    
    func addMatch() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "MatchesModel", into: context) as! MatchesModel
        
        loan.matTeamPhoto1 = matTeamPhoto1
        loan.matTeamPhoto2 = matTeamPhoto2
        loan.matTeamName1 = matTeamName1
        loan.matTeamName2 = matTeamName2
        loan.matResT1 = matResT1
        loan.matResT2 = matResT2
        loan.matLoc = matLoc
        loan.matStad = matStad
        loan.matDate = matDate
        
        CoreDataStack.shared.saveContext()
    }
    
    func fetchMatches() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<MatchesModel>(entityName: "MatchesModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.matches = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.matches = []
        }
    }
}
