//
//  cloudKitFactory.swift
//  OneAndDoneApplication
//
//  Created by Avi Maslow on 2/17/24.
//
import CloudKit
final class cloudKitFactory{
    
    static let shared = cloudKitFactory()
    
    //cant initilize  cloudkitfactory anywhere else
    private init() {}
    
    //optional bc users dont need a profile
    var userRecord: CKRecord?
    
    var profileRecordID: CKRecord.ID?
    //going to be used on launch to get userRecord
    let container =  CKContainer(identifier: "iCloud.ONEANDONE")

    
    //network call, in success get me ddglocations and when failure go give me error
    //convinence API that will handle the common stuff like retrieving list of []
    static func getLocations() async throws -> [OneandDoneLocations] {
        let sortDescriptor = NSSortDescriptor(key: OneandDoneLocations.kname, ascending: true)
        let query = CKQuery(recordType: RecordType.location, predicate: NSPredicate(value: true))
        query.sortDescriptors = [sortDescriptor]

        var locations: [OneandDoneLocations] = []

        let (matchResults, cursor) = try await CKContainer(identifier: "iCloud.ONEANDONE").publicCloudDatabase.records(matching: query)
        let records = matchResults.compactMap { _, result in try? result.get() }
        locations += records.map(OneandDoneLocations.init)

        guard let cursor = cursor else {
            return locations
        }

        do {
            return try await continueFetchingLocations(cursor: cursor, locations: locations)
        } catch {
            throw error
        }
    }

    private static func continueFetchingLocations(cursor: CKQueryOperation.Cursor,
                                                  locations: [OneandDoneLocations]) async throws -> [OneandDoneLocations] {
        var updatedLocations = locations

        let (matchResults, nextCursor) = try await CKContainer(identifier: "iCloud.ONEANDONE")
            .publicCloudDatabase.records(continuingMatchFrom: cursor)
        let records = matchResults.compactMap { _, result in try? result.get() }
        updatedLocations += records.map(OneandDoneLocations.init)

        guard let nextCursor = nextCursor else {
            return updatedLocations
        }

        return try await continueFetchingLocations(cursor: nextCursor, locations: updatedLocations)
    }


    func batchSave(records: [CKRecord]) async throws -> [CKRecord] {
        
        let operation = CKModifyRecordsOperation(recordsToSave: records)
        
        let (savedResult, _) = try await CKContainer(identifier: "iCloud.ONEANDONE").publicCloudDatabase.modifyRecords(saving: records, deleting: [])
        return savedResult.compactMap {_, result in try? result.get() }
    }
    
    func save(record: CKRecord) async throws -> CKRecord {
        return try await CKContainer(identifier: "iCloud.ONEANDONE").publicCloudDatabase.save(record)
    }
    
     
    
    
    func fetchRecord(with id: CKRecord.ID) async throws -> CKRecord {
        return try await CKContainer(identifier: "iCloud.ONEANDONE").publicCloudDatabase.record(for: id)
    }
}

