//
//  locationManager.swift
//  OneAndDoneApplication
//
//  Created by Avi Maslow on 2/17/24.
//

import Foundation

final  class locationFactory: ObservableObject {
    @Published var locations: [OneandDoneLocations] = []
    
    var selectedLocation: OneandDoneLocations?
}
