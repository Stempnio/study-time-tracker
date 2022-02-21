//
//  LearningSessionModel+CoreDataProperties.swift
//  Study Time Tracker
//
//  Created by Jakub Stepien on 21/02/2022.
//
//

import Foundation
import CoreData


extension LearningSessionModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LearningSessionModel> {
        return NSFetchRequest<LearningSessionModel>(entityName: "LearningSessionModel")
    }

    @NSManaged public var endDate: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var numberOfIntervals: Int64
    @NSManaged public var startDate: Date?
    @NSManaged public var totalTime: Int64

    var wrappedStartDate: String {
        startDate?.formatted() ?? Date.distantPast.formatted()
    }
    
    var wrappedEndDate: String {
        endDate?.formatted() ?? Date.distantPast.formatted()
    }
    
    var wrappedName: String {
        name ?? "unknown"
    }
}

extension LearningSessionModel : Identifiable {

}
