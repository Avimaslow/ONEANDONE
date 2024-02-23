//
//  ckRecords+ext.swift
//  OneAndDoneApplication
//
//  Created by Avi Maslow on 2/17/24.
//

import CloudKit

extension CKRecord {
    

    func convertToOneAndDoneLocation() -> OneandDoneLocations { OneandDoneLocations(record: self) }
    }

